import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  const CustomTextButton(
      {super.key,
      required this.text,
      this.textColor,
      this.textSize,
      this.textWeight,
      required this.onPressed,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(foregroundColor: AppColors.secondDark),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? AppColors.secondDark,
              fontSize: textSize ?? 15.sp,
              fontWeight: textWeight ?? FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.secondDark,
              decorationThickness: 2),
        ));
  }
}
