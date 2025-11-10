// lib/UI/task_form_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../ViewModel/taskViewModel.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? taskToEdit;
  
  // Rendre le constructeur constant
  const TaskFormScreen({super.key, this.taskToEdit});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Contrôleurs pour les champs de texte
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  // Utilise un double pour le Slider
  late double _nbHours; 
  late TextEditingController _difficultyController;
  
  // État temporaire pour la couleur
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    final task = widget.taskToEdit;
    
    // Initialisation des contrôleurs avec les valeurs existantes ou par défaut
    _titleController = TextEditingController(text: task?.title ?? 'Nouvelle Tâche');
    _descriptionController = TextEditingController(text: task?.description ?? 'Description par défaut');
    
    // Initialisation du Slider : Convertit l'entier en double
    _nbHours = (task?.nbhours ?? 1).toDouble(); 
    
    _difficultyController = TextEditingController(text: task?.difficulty.toString() ?? '3');
    _currentColor = task?.color ?? Colors.blue;
  }

  @override
  void dispose() {
    // Nettoyage des contrôleurs
    _titleController.dispose();
    _descriptionController.dispose();
    _difficultyController.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Utilisation des valeurs des champs et conversion du Slider en entier
      final int newNbHours = _nbHours.round();
      final int newDifficulty = int.tryParse(_difficultyController.text) ?? 0;
      
      final Task savedTask;
      
      if (widget.taskToEdit == null) {
        // --- MODE AJOUT ---
        // Incrémentation de l'ID statique
        Task.nb++;
        savedTask = Task(
          id: Task.nb, 
          title: _titleController.text,
          description: _descriptionController.text,
          nbhours: newNbHours,
          difficulty: newDifficulty,
          tags: ['Form', 'New'], // Tags par défaut
          color: _currentColor,
        );
        // Appel du ViewModel pour l'ajout
        context.read<TaskViewModel>().addTask(savedTask);
      } else {
        // --- MODE ÉDITION ---
        // Crée une nouvelle instance avec l'ID original pour la mise à jour
        savedTask = Task(
          id: widget.taskToEdit!.id,
          title: _titleController.text,
          description: _descriptionController.text,
          nbhours: newNbHours,
          difficulty: newDifficulty,
          tags: widget.taskToEdit!.tags,
          color: _currentColor,
        );
        // Appel du ViewModel pour la mise à jour
        context.read<TaskViewModel>().updateTask(savedTask);
      }

      // Retour à l'écran précédent
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAdding = widget.taskToEdit == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isAdding ? 'Ajouter une Nouvelle Tâche' : 'Éditer Tâche ${widget.taskToEdit!.id}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // CHAMP 1 : Titre
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titre de la tâche'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un titre.' : null,
              ),
              const SizedBox(height: 20),

              // CHAMP 2 : Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              const SizedBox(height: 30),

              // CHAMP 3 : Nombre d'heures (SLIDER)
              Text('Nombre d\'heures estimées:', style: Theme.of(context).textTheme.titleMedium),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: _nbHours,
                      min: 0.0,
                      max: 20.0, // Plage de 0 à 20 heures
                      divisions: 20, // 20 divisions pour avoir des valeurs entières
                      label: _nbHours.round().toString(),
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.blueAccent.shade100,
                      onChanged: (double value) {
                        setState(() {
                          _nbHours = value;
                        });
                      },
                    ),
                  ),
                  // Affichage de la valeur actuelle
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '${_nbHours.round()} h',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // CHAMP 4 : Difficulté
              TextFormField(
                controller: _difficultyController,
                decoration: const InputDecoration(labelText: 'Niveau de Difficulté (1-5)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final difficulty = int.tryParse(value!);
                  if (difficulty == null || difficulty < 1 || difficulty > 5) {
                    return 'Difficulté doit être un nombre entre 1 et 5.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Bouton Enregistrer / Ajouter
              ElevatedButton.icon(
                onPressed: _saveTask,
                icon: Icon(isAdding ? Icons.add : Icons.save),
                label: Text(isAdding ? 'Ajouter la Tâche' : 'Enregistrer les Modifications'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}