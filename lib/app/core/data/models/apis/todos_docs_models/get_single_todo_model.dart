class GetSingleTodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  GetSingleTodoModel({this.id, this.todo, this.completed, this.userId});

  GetSingleTodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
