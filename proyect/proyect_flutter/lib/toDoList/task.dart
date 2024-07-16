class Task {
  String title;
  String? description;
  bool completed;
  DateTime? deadLine;

  // Simple constructor.
  Task({required this.title, String? descrip, this.completed = false}) : description = (descrip == '')? null : descrip;

}
