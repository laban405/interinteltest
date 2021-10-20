class TodoModel {
  TodoModel(
      {this.userId = 0, this.id = 0, this.title = "", this.completed = false});

  int userId;
  int id;
  String title;
  bool completed;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
