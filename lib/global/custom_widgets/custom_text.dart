import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

enum TextStyleType {
  title, // 25px
  subTitle, // 20px
  bodyBig, // 20px
  body, // 17px
  small, // 14px
  custom,
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.textType,
    required this.text,
    this.textColor,
    this.requiered = false,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
    this.heightText,
    this.selectionColor,
  });

  final TextStyleType textType;
  final String text;
  final Color? textColor;
  final Color? selectionColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final bool? requiered;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final double? heightText;

  @override
  Widget build(BuildContext context) {
    return requiered == false
        ? Text(
            text,
            textAlign: textAlign,
            overflow: overflow ?? TextOverflow.ellipsis,
            softWrap: true,
            maxLines: maxLines ?? 1,
            style: getTextStyle(),
          )
        : RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.whiteColor,
              ),
            ),
          );
  }

  TextStyle getTextStyle() {
    switch (textType) {
      case TextStyleType.title:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w900,
          overflow: overflow ?? TextOverflow.visible,
        );

      case TextStyleType.subTitle:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: 22.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          overflow: overflow ?? TextOverflow.visible,
        );

      case TextStyleType.bodyBig:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: 20.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          overflow: overflow ?? TextOverflow.visible,
        );

      case TextStyleType.body:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          overflow: overflow ?? TextOverflow.visible,
        );

      case TextStyleType.small:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.2.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: 14.sp,
          fontWeight: fontWeight ?? FontWeight.w200,
          overflow: overflow ?? TextOverflow.visible,
        );

      case TextStyleType.custom:
        return TextStyle(
          backgroundColor: selectionColor,
          height: heightText ?? 1.h,
          decoration: textDecoration,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow ?? TextOverflow.visible,
        );
    }
  }
}
