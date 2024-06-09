// ignore_for_file: unnecessary_overrides
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/data/repositories/auth_repository.dart';
import 'package:task_manager_app/app/core/services/base_controller.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/routes/app_pages.dart';

class LoginController extends BaseController {
  final TextEditingController nameController =
      TextEditingController(text: 'emilys');
  final TextEditingController passwordController =
      TextEditingController(text: 'emilyspass');
  GlobalKey<FormState> globalKey = GlobalKey();

  void login() {
    errorMessage.value = '';
    runFullLoadingFutureFunction(
        function: AuthRepository()
            .login(
                userName: nameController.text,
                password: passwordController.text,
                expiresInMins: 1)
            .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
      } else if (value.$2 != null) {
        prefStorage.setTokenInfo(value.$2!.token!);
        prefStorage.setLoginModel(value.$2!);
        prefStorage.setFirstLogin(true);
        Get.toNamed(Routes.HOME);
      }
    }));
  }
}
