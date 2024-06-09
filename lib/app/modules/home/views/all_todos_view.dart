import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_all_todos_model.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/modules/home/controllers/all_todos_controller.dart';
import 'package:task_manager_app/global/custom_widgets/custom_button.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text_form.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

// ignore: must_be_immutable
class AllTodosView extends GetView<AllTodosController> {
  AllTodosView({super.key});
  @override
  AllTodosController controller = Get.put(AllTodosController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blackColor,
      onRefresh: () async {
        await controller.getAllTodos();
      },
      child: Stack(
        children: [
          Obx(() => controller.success.value == true
              ? Padding(
                  padding: EdgeInsets.only(top: 0.08.sh),
                  child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      controller: controller.scrollController,
                      itemCount: controller.todosList.length,
                      itemBuilder: (context, index) {
                        final todoTtem = controller.todosList[index];
                        return InkWell(
                          onTap: () {
                            controller.todoController.text =
                                todoTtem.todo ?? 'missing data';
                            controller.completed.value = todoTtem.completed!;
                            todosDialog(todoTtem.id!);
                          },
                          child: todo(todo: todoTtem),
                        );
                      })),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 0.16.sh),
                  child: controller.errorMessage.value == ''
                      ? SpinKitCircle(
                          color: AppColors.mainBlue,
                        )
                      : CustomText(
                          textType: TextStyleType.body,
                          text: controller.errorMessage.value),
                )),
          titeBar(),
        ],
      ),
    );
  }

  void todosDialog(int id) {
    Get.defaultDialog(
        title: 'task details',
        backgroundColor: AppColors.whiteColor,
        content: SizedBox(
          height: 0.34.sh,
          child: Column(
            children: [
              CustomTextForm(
                maxLines: 5,
                controller: controller.todoController,
              ),
              Row(
                children: [
                  const CustomText(
                      textType: TextStyleType.body, text: 'is completete?'),
                  0.03.sw.pw,
                  Obx(() => IconButton(
                      onPressed: () {
                        controller.completed.value =
                            !controller.completed.value;
                      },
                      icon: controller.completed.value
                          ? Icon(Icons.check_box, color: AppColors.greenColor)
                          : Icon(Icons.check_box_outline_blank,
                              color: AppColors.secondDark))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    text: 'Delete',
                    onPressed: () {
                      controller.deleteTodo(id);
                    },
                    textColor: AppColors.mainDark,
                    backgroundColor: AppColors.whiteColor,
                  ),
                  CustomButton(
                      text: 'Edit',
                      onPressed: () {
                        controller.editTodo(id);
                      }),
                ],
              ),
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

  Widget todo({required Todos todo}) {
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
          SizedBox(
            width: 0.35.sw,
            child: CustomText(
              textType: TextStyleType.body,
              text: todo.todo ?? 'missing name',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          0.18.sw.pw,
          CustomText(
              textType: TextStyleType.body,
              text: storage.getLoginModel.firstName ?? 'no name'),
          const Spacer(),
          Icon(
            todo.completed == true ? Icons.check : Icons.cancel,
            color: todo.completed == true
                ? AppColors.greenColor
                : AppColors.redColor,
          ),
          0.03.sw.pw
        ],
      ),
    );
  }
}
