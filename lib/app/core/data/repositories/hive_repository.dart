import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:task_manager_app/app/core/data/models/apis/auth_models/login_model.dart';

class HiveRepository {
  //static string name for keys
  static String hiveFirstLaunch = "first_launch";
  static String hiveFirstLogin = "first_login";
  static String hiveTokenInfo = 'token_info';
  static String hiveLocaleInfo = "locale_info";
  static String hiveUserInfo = "user_info";

  //static string name for boxes
  String primaryBoxName = "primary_box_name";
  String loginBoxName = 'login_box_name';

  //Boxes
  late Box primaryBox;
  late Box loginBox;

  //initilaize Hive and open Big general box to access it in main method
  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    primaryBox = await Hive.openBox(primaryBoxName);
    loginBox = await Hive.openBox(loginBoxName);
  }

  Future<void> clearHive() async {
    await primaryBox.clear();
    await loginBox.clear();
  }

  // Future<void> openBox(Box box, String boxName) async {
  //   box = await Hive.openBox(boxName);
  // }

  Future<void> closeBox(Box box) async {
    if (box.isNotEmpty) {
      await box.clear();
    }
  }

  //Store First application launch
  Future<void> setFirstLaunch(bool value) async {
    await Hive.box(primaryBoxName).put(hiveFirstLaunch, value);
  }

  bool get getFirstLaunch =>
      Hive.box(primaryBoxName).get(hiveFirstLaunch, defaultValue: false);

  // Store First login to prevent multi login after closing app
  Future<void> setFirstLogin(bool value) async {
    await Hive.box(primaryBoxName).put(hiveFirstLogin, value);
  }

  bool get getFirstLogin =>
      Hive.box(primaryBoxName).get(hiveFirstLogin, defaultValue: false);

  //Store token and get it
  Future<void> setTokenInfo(String value) async {
    await Hive.box(primaryBoxName).put(hiveTokenInfo, value);
  }

  String get getTokenInfo =>
      Hive.box(primaryBoxName).get(hiveTokenInfo, defaultValue: '');

  // Store device language
  Future<void> setAppLanguage(String value) async {
    await Hive.box(primaryBoxName).put(hiveLocaleInfo, value);
  }

  String get getAppLanguage {
    if (Hive.box(primaryBoxName).containsKey(hiveLocaleInfo)) {
      return Hive.box(primaryBoxName).get(hiveLocaleInfo, defaultValue: '');
    } else {
      return 'en';
    }
  }

//Store verification model for auth fill information
  Future<void> setLoginModel(LoginModel model) async {
    await Hive.box(loginBoxName).put(hiveUserInfo, jsonEncode(model.toJson()));
  }

  LoginModel get getLoginModel {
    if (Hive.box(loginBoxName).containsKey(hiveUserInfo)) {
      return LoginModel.fromJson(jsonDecode(Hive.box(loginBoxName)
          .get(hiveUserInfo, defaultValue: LoginModel())));
    } else {
      return LoginModel();
    }
  }
}
