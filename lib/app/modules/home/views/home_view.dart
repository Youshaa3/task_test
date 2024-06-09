import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/modules/home/views/add_new_todo_view.dart';
import 'package:task_manager_app/app/modules/home/views/all_todos_view.dart';
import 'package:task_manager_app/app/modules/home/views/profile_view.dart';
import 'package:task_manager_app/app/modules/home/views/search_random_view.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(0.04.sw),
        height: 1.sw * .155,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 1.sw * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.currentIndex.value = index;
              controller.pageController.jumpToPage(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    0.001.sh.ph,
                    Icon(
                      listOfIcons[index],
                      size: 1.sw * .076,
                      color: index == controller.currentIndex.value
                          ? AppColors.mainBlue
                          : AppColors.greyColor,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == controller.currentIndex.value
                            ? 0
                            : 1.sw * .029,
                        right: 1.sw * .0422,
                        left: 1.sw * .0422,
                      ),
                      width: 1.sw * .128,
                      height: index == controller.currentIndex.value
                          ? 1.sw * .014
                          : 0,
                      decoration: BoxDecoration(
                        color: AppColors.mainBlue,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientBlue,
                AppColors.gradientBlue.withOpacity(1),
                AppColors.gradientBlue.withOpacity(0.7),
                AppColors.whiteColor
              ]),
        ),
        child: PageView(
          controller: controller.pageController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AllTodosView(),
            AddNewTodoView(),
            ProfileView(),
            const SearchRandomView()
          ],
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.task,
    Icons.add_box,
    Icons.person_rounded,
    Icons.search
  ];
}
