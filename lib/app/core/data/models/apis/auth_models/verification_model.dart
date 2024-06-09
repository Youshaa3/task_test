class VerificationModel {
  String? msg;
  String? token;
  String? refreshToken;
  Null userAvatar;
  int? userId;
  String? userName;
  String? userAbout;

  VerificationModel(
      {this.msg,
      this.token,
      this.refreshToken,
      this.userAvatar,
      this.userId,
      this.userName,
      this.userAbout});

  VerificationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    userAvatar = json['user_avatar'];
    userId = json['user_id'];
    userName = json['user_name'];
    userAbout = json['user_about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    data['user_avatar'] = userAvatar;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_about'] = userAbout;
    return data;
  }
}
