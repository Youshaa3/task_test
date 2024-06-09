import 'package:task_manager_app/app/core/data/models/apis/auth_models/get_current_auth_user_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/auth_models/login_model.dart';
import 'package:task_manager_app/app/core/data/models/apis/auth_models/refresh_auth_session_model.dart';
import 'package:task_manager_app/app/core/data/models/common_response.dart';
import 'package:task_manager_app/app/core/data/network/end_points/auth_endpoints.dart';
import 'package:task_manager_app/app/core/data/network/network_config.dart';
import 'package:task_manager_app/app/core/enums/request_type.dart';
import 'package:task_manager_app/app/core/utils/network_utils.dart';

class AuthRepository {
  Future<(String?, LoginModel?)> login(
      {required String userName,
      required String password,
      required int expiresInMins}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.post,
          url: AuthEndpoints.login,
          body: {
            'username': userName,
            'password': password,
            'expiresInMins': expiresInMins
          },
          headers: NetworkConfig.getHeaders(
            type: RequestType.post,
            needAuth: false,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              LoginModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet conniction', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, GetCurrentAuthUserModel?)> getCurrentUser() async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.get,
          url: AuthEndpoints.getCurrentUser,
          headers: NetworkConfig.getHeaders(
            type: RequestType.get,
            needAuth: true,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              GetCurrentAuthUserModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet conniction', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, RefreshAuthSessionModel?)> refreshSession(
      {required String refreshToken, required int expiresInMins}) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.post,
          url: AuthEndpoints.refreshSession,
          body: {'refreshToken': refreshToken, 'expiresInMins': expiresInMins},
          headers: NetworkConfig.getHeaders(
            type: RequestType.post,
            needAuth: false,
          )).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus == false) {
            return (
              commonResponse.message ?? '',
              null,
            );
          } else {
            return (
              null,
              RefreshAuthSessionModel.fromJson(commonResponse.data!),
            );
          }
        } else {
          return ('Check your internet conniction', null);
        }
      });
    } catch (e) {
      return (e.toString(), null);
    }
  }
}
