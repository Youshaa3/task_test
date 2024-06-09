import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onsaved;
  final ValueChanged<String>? onFieldSubmitted;
  final String? text;
  final TextInputType? keyboardType;
  final String? label;
  final Widget? icon;
  final Widget? sufexIcon;
  final int? maxLength;
  final Color? color;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool? alignLabelWithHint;
  final int? maxLines;
  final int? minLines;
  final double? fontSize;
  final double? hintSize;
  final double? borderRadius;
  final TextEditingController? controller;
  final double? fieldWidth;
  final String? hint;
  final Color? hintColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? enabledBorderColor;
  final TextStyle? counterStyle;
  final bool enabled;
  final void Function(String?)? onChanged;
  final EdgeInsets? contentPadding;
  final InputDecoration? decoration;
  final TextDirection? textDirection;
  final TextStyle? style;
  final Color? cursorColor;
  final TextInputAction? textInputAction;
  final double? borderwidth;
  final bool? showNumberOfCharacter;
  final bool? requiered;
  final TextCapitalization? capitalLetter;
  final InputBorder? focusedBorder;

  // ignore: prefer_const_constructors_in_immutables
  CustomTextForm(
      {super.key,
      this.validator,
      this.onsaved,
      this.onFieldSubmitted,
      this.text,
      this.keyboardType,
      this.label,
      this.icon,
      this.requiered,
      this.maxLength,
      this.color,
      this.textColor,
      this.inputFormatters,
      this.alignLabelWithHint,
      this.maxLines,
      this.minLines,
      this.fontSize,
      this.borderRadius,
      this.controller,
      this.fieldWidth,
      this.hint,
      this.hintColor,
      this.counterStyle,
      this.enabled = true,
      this.onChanged,
      this.contentPadding,
      this.decoration,
      this.textDirection,
      this.style,
      this.cursorColor,
      this.sufexIcon,
      this.textInputAction,
      this.borderwidth,
      this.borderColor,
      this.showNumberOfCharacter = true,
      this.capitalLetter,
      this.hintSize,
      this.focusBorderColor,
      this.enabledBorderColor,
      this.focusedBorder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth?.w ?? 0.95.sw,
      child: FocusScope(
        child: Focus(
          onFocusChange: (t) {
            t
                ? controller?.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller?.text.length ?? 0))
                : null;
          },
          child: TextFormField(
            textCapitalization: capitalLetter ?? TextCapitalization.sentences,
            initialValue: text,
            enabled: enabled,
            minLines: maxLines ?? 1,
            style: style ??
                TextStyle(
                    fontSize: fontSize?.sp ?? 14.sp,
                    color: textColor ?? AppColors.blackColor),
            keyboardType: keyboardType,
            maxLength: showNumberOfCharacter != false ? maxLength : null,
            cursorColor: cursorColor ?? AppColors.blackColor,
            validator: validator,
            onSaved: onsaved,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            inputFormatters: [
              maxLength != null
                  ? NameValidator(maxLength!)
                  : NameValidator(600),
              if (inputFormatters != null) ...inputFormatters!,
            ],
            maxLines: maxLines ?? 1,
            controller: controller,
            textInputAction: textInputAction ?? TextInputAction.newline,
            decoration: decoration ??
                InputDecoration(
                  isDense: true,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: hintSize ?? 14.sp,
                    color: hintColor ?? AppColors.greyColor,
                  ),
                  counterStyle:
                      counterStyle ?? TextStyle(color: AppColors.blackColor),
                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: enabledBorderColor ?? AppColors.blackColor),
                    borderRadius: BorderRadius.circular(borderRadius ?? 9.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? AppColors.blackColor),
                    borderRadius: BorderRadius.circular(borderRadius ?? 9.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.w, color: Colors.red),
                    borderRadius: BorderRadius.circular(borderRadius ?? 9.r),
                  ),
                  focusedBorder: focusedBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(
                            width: borderwidth ?? 1.w,
                            color: focusBorderColor ?? AppColors.secondDark),
                        borderRadius:
                            BorderRadius.circular(borderRadius ?? 9.r),
                      ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  fillColor: color ?? AppColors.whiteColor,
                  errorStyle: const TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                  filled: true,

                  // labelText: hint,
                  labelStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: fontSize?.sp ?? 120.sp),
                  prefixIcon: icon,
                  suffixIcon: sufexIcon,
                  alignLabelWithHint: alignLabelWithHint,
                ),
          ),
        ),
      ),
    );
  }
}

class NameValidator extends TextInputFormatter {
  final int maxLength;

  NameValidator(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length <= maxLength) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
