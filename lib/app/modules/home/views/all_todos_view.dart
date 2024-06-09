import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/modules/home/controllers/all_todos_controller.dart';
import 'package:task_manager_app/global/custom_widgets/custom_button.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

class AllTodosView extends GetView<AllTodosController> {
  const AllTodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0.05.sh),
          child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              itemCount: 30,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    todosDialog();
                  },
                  child: todo(),
                );
              }),
        ),
        titeBar(),
      ],
    );
  }

  void todosDialog() {
    Get.defaultDialog(
        title: 'This is the first task',
        content: SizedBox(
          height: 0.05.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: 'Delete',
                onPressed: () {},
                textColor: AppColors.mainDark,
                backgroundColor: AppColors.whiteColor,
              ),
              CustomButton(text: 'Edit', onPressed: () {}),
            ],
          ),
        ));
  }

  Widget titeBar() {
    return Container(
      height: 0.08.sh,
      padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
      margin: EdgeInsets.symmetric(vertical: 0.04.sh, horizontal: 0.01.sw),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor, width: 2),
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.secondDark),
      child: Row(
        children: [
          CustomText(
              textType: TextStyleType.body,
              text: "Task Name",
              textColor: AppColors.whiteColor),
          0.27.sw.pw,
          CustomText(
              textType: TextStyleType.body,
              text: "User Name",
              textColor: AppColors.whiteColor),
          const Spacer(),
          CustomText(
              textType: TextStyleType.body,
              text: "Status",
              textColor: AppColors.whiteColor),
        ],
      ),
    );
  }

  Widget todo() {
    return Container(
      width: 0.92.sw,
      height: 0.05.sh,
      margin: EdgeInsetsDirectional.only(
          start: 0.03.sw, end: 0.03.sw, top: 0.01.sh),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.mainBlue, width: 2))),
      child: Row(
        children: [
          const CustomText(
              textType: TextStyleType.small, text: "This is the first task"),
          0.18.sw.pw,
          const CustomText(textType: TextStyleType.small, text: "Youshaa"),
          const Spacer(),
          Icon(
            Icons.check,
            color: AppColors.greenColor,
          ),
          0.03.sw.pw
        ],
      ),
    );
  }
}
