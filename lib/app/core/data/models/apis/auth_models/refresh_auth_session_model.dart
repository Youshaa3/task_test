class RefreshAuthSessionModel {
  String? token;
  String? refreshToken;

  RefreshAuthSessionModel({this.token, this.refreshToken});

  RefreshAuthSessionModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
