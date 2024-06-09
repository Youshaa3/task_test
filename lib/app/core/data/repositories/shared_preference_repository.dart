import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/app/core/data/models/apis/auth_models/login_model.dart';
import 'package:task_manager_app/app/core/enums/data_type.dart';

class SharedPrefreanceRepository {
  SharedPreferences globalSharedPrefs = Get.find();

  static String prefFirstLogin = "first_login";
  static String prefTokenInfo = 'token_info';
  static String prefUserInfo = "user_info";

  setFirstLogin(bool value) {
    setPrefrance(dataType: DataType.bool, key: prefFirstLogin, value: value);
  }

  bool getFirstLogin() {
    if (globalSharedPrefs.containsKey(prefFirstLogin)) {
      return getPrefrance(key: prefFirstLogin);
    } else {
      return false;
    }
  }

  setLoginModel(LoginModel value) {
    setPrefrance(
      dataType: DataType.string,
      key: prefUserInfo,
      value: jsonEncode(value),
    );
  }

  LoginModel? getLoginModel() {
    if (globalSharedPrefs.containsKey(prefUserInfo)) {
      return LoginModel.fromJson(jsonDecode(getPrefrance(key: prefUserInfo)));
    } else {
      return null;
    }
  }

  setTokenInfo(String value) {
    setPrefrance(
      dataType: DataType.string,
      key: prefTokenInfo,
      value: jsonEncode(value),
    );
  }

  String? getTokenInfo() {
    if (globalSharedPrefs.containsKey(prefUserInfo)) {
      return getPrefrance(key: prefTokenInfo);
    } else {
      return null;
    }
  }

  setPrefrance(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.int:
        await globalSharedPrefs.setInt(key, value);
        break;
      case DataType.bool:
        await globalSharedPrefs.setBool(key, value);
        break;
      case DataType.string:
        await globalSharedPrefs.setString(key, value);
        break;
      case DataType.double:
        await globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.listString:
        await globalSharedPrefs.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrance({required String key}) {
    return globalSharedPrefs.get(key);
  }
}
