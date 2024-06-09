import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager_app/app/core/enums/message_type.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';
import 'custom_text.dart';

class CustomToast {
  final double? width;
  final double? height;

  CustomToast({this.width, this.height});

  static showMessage(
      {required String message,
      double? width,
      double? height,
      MessageType? messagetype = MessageType.showInfo}) {
    BotToast.showCustomText(
      duration: const Duration(seconds: 4),
      toastBuilder: (cancelFunc) {
        String imageName;
        Color shadowColor;
        switch (messagetype!) {
          case MessageType.showInfo:
            imageName = 'INFO';
            shadowColor = AppColors.secondBlue;
            break;

          case MessageType.warning:
            imageName = 'WARNING';
            shadowColor = AppColors.orangeColor;
            break;

          case MessageType.rejected:
            imageName = 'REJECTED';
            shadowColor = AppColors.redColor;
            break;

          case MessageType.success:
            imageName = 'SUCCESS';
            shadowColor = AppColors.greenColor;
            break;
        }
        return GestureDetector(
          onTap: cancelFunc, // Dismiss the toast when tapped
          child: Container(
            width: 250.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.blackColor,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 0.3,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/$imageName.json',
                  width: 40.w,
                  height: 40.w,
                ),
                (10.h).ph,
                CustomText(
                  heightText: 1,
                  text: message,
                  textColor: shadowColor,
                  overflow: TextOverflow.ellipsis,
                  maxLines: message.length > 25 ? 3 : 1,
                  textType: message.length < 10
                      ? TextStyleType.body
                      : TextStyleType.bodyBig,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
