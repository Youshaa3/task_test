import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:task_manager_app/app/core/data/repositories/auth_repository.dart';
import 'package:task_manager_app/app/core/enums/message_type.dart';
import 'package:task_manager_app/app/core/enums/request_type.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/global/custom_widgets/custom_toast.dart';

class NetworkUtil {
  static String baseUrl = 'dummyjson.com';
  static var client = Client();

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? params,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    log(body.toString(), name: 'BODY');
    log(headers.toString());
    try {
      var uri = Uri.https(baseUrl, url, params);
      log(uri.toString(), name: 'URL');

      late Response response;

      Map<String, dynamic> jsonRespons = {};

      switch (type) {
        case RequestType.get:
          response = await client.get(uri, headers: headers);

          break;
        case RequestType.post:
          response = await client
              .post(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.put:
          response = await client
              .put(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.delete:
          response = await client
              .delete(uri, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 20), onTimeout: () {
            return response;
          });

          break;
        case RequestType.multipart:
          break;
      }

      dynamic result;
      try {
        result = jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {
        log(e.toString(), name: 'EXEPTION');
      }

      if (response.statusCode == 401) {
        await AuthRepository()
            .refreshSession(
                refreshToken: prefStorage.getLoginModel()!.refreshToken!,
                expiresInMins: 30)
            .then((value) {
          if (value.$2 != null) {
            prefStorage.setTokenInfo(value.$2!.token!);
            prefStorage.getLoginModel()!.refreshToken = value.$2!.refreshToken;
            CustomToast.showMessage(
                message: 'Please try again', messagetype: MessageType.showInfo);
          }
        });
      } else {
        jsonRespons.putIfAbsent('statusCode', () => response.statusCode);
        jsonRespons.putIfAbsent(
            'response',
            () => result != null
                ? jsonDecode(utf8.decode(response.bodyBytes))
                : {'success': utf8.decode(response.bodyBytes)});
        log(jsonRespons.toString(), name: 'Response');
        return jsonRespons;
      }
    } catch (e) {
      log(e.toString(), name: 'EXEPTION');
      log("error from network utils");
    }
  }

  static Future<dynamic> sendMultipartRequest({
    required String url,
    required RequestType type,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
    try {
      var uri = Uri.https(baseUrl, url, params);
      var request = MultipartRequest("POST", uri);
      log(uri.toString());
      var futures = <Future>[];
      files!.forEach((key, value) {
        if (value.isNotEmpty) {
          var multipartFile = MultipartFile.fromPath(key, value,
              filename: basename(value),
              contentType: MediaType.parse(lookupMimeType(value) ?? ''));
          futures.add(multipartFile);
        }
      });
      var multipartFiles = await Future.wait(futures);
      for (var file in multipartFiles) {
        request.files.add(file);
      }

      request.headers.addAll(headers!);
      request.fields.addAll(fields!);
      log(request.fields.toString(), name: 'fields');
      log(request.headers.toString(), name: 'headers');
      log(request.files.toString(), name: 'files');
      log(files.toString(), name: 'files');
      var response = await request.send().timeout(
            const Duration(minutes: 10),
          );
      log(response.toString());
      switch (response.statusCode) {
        case 400:
          throw Exception('400 Bad request');
        case 401:
          throw Exception('401 Unauthorized');
        case 403:
          throw Exception('403 Forbidden');
        case 500:
          throw Exception('500 Internal server error');
      }

      Map<String, dynamic> responseJson = {};
      dynamic value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {
        log(e.toString());
      }
      log(value.toString());
      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));
      return responseJson;
    } catch (error) {
      log(error.toString());
    }
  }
}
