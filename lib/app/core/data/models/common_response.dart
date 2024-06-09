import 'dart:developer';

class CommonResponse<T> {
  T? data;
  int? statusCode;
  String? message;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    try {
      this.statusCode = json['statusCode'];
      if (statusCode == 200 || statusCode == 201) {
        this.data = json['response'];
      } else {
        if (json['response']['message'] != null && json['response'] is Map) {
          this.message = json['response']['message'];
        } else {
          switch (statusCode) {
            case 400:
              message = '400 Bad request';
              break;
            case 401:
              message = '401 Unauthorized';
              break;
            case 500:
              message = '500 Internal server error';
              break;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  bool get getStatus => statusCode == 200 || statusCode == 201 ? true : false;
}
