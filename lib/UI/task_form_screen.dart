import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../ViewModel/taskViewModel.dart'; 


class TaskFormScreen extends StatefulWidget {
  final Task? taskToEdit;
  
  const TaskFormScreen({super.key, this.taskToEdit});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final bool isEditing = widget.taskToEdit != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Éditer la Tâche ${widget.taskToEdit!.id}' : 'Ajouter une Nouvelle Tâche'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          initialValue: isEditing ? {
            'title': widget.taskToEdit!.title,
            'description': widget.taskToEdit!.description,
            'tags': widget.taskToEdit!.tags.join(','),
            'difficulty': widget.taskToEdit!.difficulty.toString(),
            'nbhours': widget.taskToEdit!.nbhours.toString(),
          } : {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(labelText: 'Titre de la tâche'),
                validator: FormBuilderValidators.required(errorText: 'Le titre est requis.'),
              ),
              FormBuilderTextField(
                name: 'description',
                decoration: const InputDecoration(labelText: 'Description de la tâche'),
                validator: FormBuilderValidators.required(errorText: 'La description est requise.'),
              ),
              FormBuilderTextField(
                name: 'tags',
                decoration: const InputDecoration(labelText: 'Tags associés (séparés par des virgules)'),
                validator: FormBuilderValidators.required(errorText: 'Au moins un tag est requis.'),
              ),
              FormBuilderTextField(
                name: 'difficulty',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Difficulté (Entier 1-5)'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.integer(errorText: 'Doit être un nombre entier.'),
                  FormBuilderValidators.min(1, errorText: 'Minimun 1.'),
                  FormBuilderValidators.max(5, errorText: 'Maximum 5.'),
                ]),
              ),
              FormBuilderTextField(
                name: 'nbhours',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Nombre d\'heures (Entier)'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.integer(errorText: 'Doit être un nombre entier.'),
                ]),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final formData = _formKey.currentState!.value;

                    final Task taskToSave = Task(
                      id: isEditing ? widget.taskToEdit!.id : 0, 
                      title: formData['title'],
                      tags: (formData['tags'] as String).split(',').map((tag) => tag.trim()).toList(),
                      nbhours: int.parse(formData['nbhours']),
                      difficulty: int.parse(formData['difficulty']),
                      description: formData['description'],
                      color: isEditing ? widget.taskToEdit!.color : Colors.teal, 
                    );

                    final taskViewModel = context.read<TaskViewModel>();

                    if (isEditing) {
                      await taskViewModel.updateTask(taskToSave);
                    } else {
                      await taskViewModel.addTask(taskToSave);
                    }
                    
                    Navigator.pop(context);
                  }
                },
                icon: Icon(isEditing ? Icons.save : Icons.add),
                label: Text(isEditing ? 'Enregistrer les Modifications' : 'Ajouter la Tâche'),
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