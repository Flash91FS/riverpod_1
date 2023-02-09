
class Task {
  String id;
  String description;
  bool completed;

  Task({
    required this.id,
    required this.description,
    this.completed = false,
  });

  Task copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }


// Task.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   description = json['description'];
//   completed = json['completed'];
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['description'] = this.description;
//   data['completed'] = this.completed;
//   return data;
// }
}
