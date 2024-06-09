import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

// ignore: must_be_immutable
class CustomImageAvatar extends StatelessWidget {
  CustomImageAvatar(
      {super.key,
      required this.image,
      this.width,
      this.height,
      this.icon,
      this.iconColor,
      this.fromNetwork});
  String? image;
  bool? fromNetwork = false;
  double? width;
  double? height;
  IconData? icon;
  Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0.5.sw,
      height: height ?? 0.23.sh,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mainBlue, width: 2),
        color: AppColors.greyColor.withBlue(500),
        shape: BoxShape.circle,
      ),
      child: image != ''
          ? ClipOval(
              child: fromNetwork == true
                  ? CachedNetworkImage(
                      imageUrl: image!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    )
                  : Image.file(
                      File(image ?? ''),
                      fit: BoxFit.cover,
                    ),
            )
          : Icon(icon ?? Icons.add_a_photo,
              color: iconColor ?? AppColors.mainBlue.withOpacity(0.5)),
    );
  }
}
