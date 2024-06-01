class Task {
  String content;
  DateTime timestamp;
  bool completed;

  Task({ required this.content, required this.timestamp, required this.completed});

  factory Task.fromJson(Map task) {

    return Task(
      content: task['content'],
      timestamp: DateTime.parse(task['timestamp']),
      completed: task['completed']

    );
  }
  Map toMap(){

    return {
      "content": content,
      "timestamp": timestamp.toString(),
      "completed": completed
    };
  }
}