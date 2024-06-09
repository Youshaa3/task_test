import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key, this.color, this.width, this.height});
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 0.9.sw,
        height: height ?? 0.002.sh,
        color: color ?? AppColors.secondDark,
      ),
    );
  }
}
