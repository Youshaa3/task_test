import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/modules/home/controllers/profile_controller.dart';
import 'package:task_manager_app/global/custom_widgets/custom_image_avatar.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text.dart';
import 'package:task_manager_app/global/custom_widgets/custom_vertical_divider.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  @override
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final userInfo = prefStorage.getLoginModel();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.07.sh, horizontal: 0.03.sh),
      child: Column(
        children: [
          CustomText(
              textType: TextStyleType.title,
              text: userInfo!.username ?? 'no name',
              textColor: AppColors.secondDark),
          0.03.sh.ph,
          CustomImageAvatar(image: userInfo.image, fromNetwork: true),
          0.1.sh.ph,
          rowInfo('Email:', userInfo.email),
          0.005.sh.ph,
          const CustomVerticalDivider(),
          0.03.sh.ph,
          rowInfo('First name:', userInfo.firstName),
          0.005.sh.ph,
          const CustomVerticalDivider(),
          0.03.sh.ph,
          rowInfo('Last name:', userInfo.lastName),
          0.005.sh.ph,
          const CustomVerticalDivider(),
          0.03.sh.ph,
          rowInfo('Gender:', userInfo.gender),
          0.005.sh.ph,
          const CustomVerticalDivider()
        ],
      ),
    );
  }

  Widget rowInfo(String prefix, String? text) {
    return Row(
      children: [
        CustomText(textType: TextStyleType.bodyBig, text: prefix),
        0.03.sw.pw,
        CustomText(textType: TextStyleType.body, text: text ?? 'no name'),
      ],
    );
  }
}
