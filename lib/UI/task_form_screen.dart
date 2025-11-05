import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_app/ViewModel/taskViewModel.dart';
import 'package:td2_app/models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? taskToEdit; 

  const TaskFormScreen({super.key, this.taskToEdit});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late int _nbHours;
  late int _difficulty;
  late String _tags;

  @override
  void initState() {
    super.initState();
    final task = widget.taskToEdit;
    _title = task?.title ?? '';
    _description = task?.description ?? '';
    _nbHours = task?.nbhours ?? 1;
    _difficulty = task?.difficulty ?? 1;
    _tags = task?.tags.join(', ') ?? ''; 
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      final taskViewModel = context.read<TaskViewModel>();
      final isEditing = widget.taskToEdit != null;
      
      final newTask = Task(
        id: isEditing ? widget.taskToEdit!.id : null,
        title: _title,
        description: _description,
        nbhours: _nbHours,
        difficulty: _difficulty,
        tags: _tags.split(',').map((e) => e.trim()).toList(),
        color: widget.taskToEdit?.color ?? Colors.lightBlue, 
      );

      if (isEditing) {
        taskViewModel.updateTask(newTask);
      } else {
        taskViewModel.addTask(newTask);
      }
      
      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskToEdit == null ? 'Ajouter une Tâche' : 'Éditer la Tâche ${widget.taskToEdit!.id}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Champ Titre
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Titre'),
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un titre' : null,
                onSaved: (value) => _title = value!,
              ),
              const SizedBox(height: 16),

              // Champ Description
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 16),

              // Champ Nb Heures
              TextFormField(
                initialValue: _nbHours.toString(),
                decoration: const InputDecoration(labelText: 'Nombre d\'heures'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Veuillez entrer un nombre valide';
                  }
                  return null;
                },
                onSaved: (value) => _nbHours = int.parse(value!),
              ),
              const SizedBox(height: 16),

              // Champ Difficulté
              TextFormField(
                initialValue: _difficulty.toString(),
                decoration: const InputDecoration(labelText: 'Difficulté (1-5)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final num = int.tryParse(value ?? '');
                  if (num == null || num < 1 || num > 5) {
                    return 'Veuillez entrer un nombre entre 1 et 5';
                  }
                  return null;
                },
                onSaved: (value) => _difficulty = int.parse(value!),
              ),
              const SizedBox(height: 16),
              
              // Champ Tags
              TextFormField(
                initialValue: _tags,
                decoration: const InputDecoration(labelText: 'Tags (séparés par des virgules)'),
                onSaved: (value) => _tags = value!,
              ),
              const SizedBox(height: 24),
              
              // Bouton de Soumission
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.taskToEdit == null ? 'Ajouter la Tâche' : 'Sauvegarder les Modifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}