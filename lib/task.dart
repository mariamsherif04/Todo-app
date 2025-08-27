class Task {
  String title;
  String detail;
  bool isCompleted;

  Task({
    required this.title,
    required this.detail,
    this.isCompleted = false,
  });
}
