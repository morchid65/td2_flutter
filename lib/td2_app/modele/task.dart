class Task {
  int id;
  String title;

  List<String> tags;
  int nbhours;
  int difficuty;
  String description;
  Color color;

  Task({
    required this.id,
    required this.title,
    required this.tags,
    required this.nbhours,
    required this.difficuty,
    required this.description,
  });

  static List<Task> generateTask(int i) {
    List<Task> tasks = [];
    for (int n = 0; n < i; n++) {
      tasks.add(Task(
        id: n,
        title: "title $n",
        tags: ['tag $n', 'tag ${n + 1}'],
        nbhours: n,
        difficuty: n,
        description: '$n',
      ));
    }
    return tasks;
  }
}