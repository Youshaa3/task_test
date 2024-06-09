// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/global/custom_widgets/custom_app_layout.dart';
import 'package:task_manager_app/global/custom_widgets/custom_button.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text_button.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text_form.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

import '../controller/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  @override
  LoginController controller = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomAppLayout(forWardWidget: registerationWidget()));
  }

  Widget registerationWidget() {
    return Form(
      key: controller.globalKey,
      child: Column(
        children: [
          0.1.sh.ph,
          CustomTextForm(
            controller: controller.nameController,
            hint: 'user name',
            validator: (value) =>
                (value!.isEmpty) ? 'user name is required' : null,
            sufexIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
          ),
          0.015.sh.ph,
          CustomTextForm(
            controller: controller.passwordController,
            hint: 'password',
            validator: (value) =>
                (value!.isEmpty) ? 'password is required' : null,
            sufexIcon: const Icon(Icons.password),
            keyboardType: TextInputType.visiblePassword,
          ),
          0.03.sh.ph,
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (controller.globalKey.currentState!.validate()) {
                controller.login();
              }
            },
          ),
          0.01.sh.ph,
          Obx(
            () => Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 0.2.sw),
            child: Row(
              children: [
                CustomText(
                    textType: TextStyleType.small,
                    textColor: AppColors.mainDark,
                    text: "Don't have an account?"),
                CustomTextButton(
                    text: "SignUp",
                    onPressed: () {
                      controller.errorMessage.value =
                          'Signup not included in our test';
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
