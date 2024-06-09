import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final double? borderWidth;
  final double? valueBorderRadius;
  final FontWeight? textFontWeight;
  final Color? borderColor;
  final Color? backgroundColor;
  final Function onPressed;
  final double? width;
  final double? height;
  final String? svgName;
  final Size? fixedSize;
  final BorderRadiusGeometry? borderRadius;
  const CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.textSize,
    this.width,
    this.height,
    this.textFontWeight,
    this.borderColor,
    this.backgroundColor,
    required this.onPressed,
    this.svgName,
    this.fixedSize,
    this.borderRadius,
    this.borderWidth,
    this.valueBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size.zero, // Set this
          padding: EdgeInsets.zero,
          shadowColor: AppColors.mainBlue,
          elevation: 4,
          side: borderColor != null
              ? BorderSide(
                  width: borderWidth ?? 2,
                  color: borderColor ?? AppColors.mainBlue)
              : null,
          backgroundColor: backgroundColor ?? AppColors.secondDark,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(valueBorderRadius ?? 7.r)),
          fixedSize: fixedSize ?? Size(width ?? 110.w, height ?? 70.h),
          maximumSize: fixedSize ?? Size(110.w, 40.h)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgName != null) ...[
            Image.asset('assets/images/$svgName.png',
                width: 0.02.sw, height: 0.1.sh),
            // 0.01.sw.pw,
          ],
          Text(
            text,
            style: TextStyle(
                color: textColor ?? AppColors.whiteColor,
                fontSize: textSize ?? 15.sp,
                fontWeight: textFontWeight ?? FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
