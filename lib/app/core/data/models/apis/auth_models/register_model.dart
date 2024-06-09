class RegisterModel {
  String? msg;

  RegisterModel({this.msg});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    return data;
  }
}
