class DeleteTodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  bool? isDeleted;
  String? deletedOn;

  DeleteTodoModel(
      {this.id,
      this.todo,
      this.completed,
      this.userId,
      this.isDeleted,
      this.deletedOn});

  DeleteTodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
    isDeleted = json['isDeleted'];
    deletedOn = json['deletedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    data['isDeleted'] = isDeleted;
    data['deletedOn'] = deletedOn;
    return data;
  }
}
