import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/app/modules/home/controllers/add_new_todo_controller.dart';
import 'package:task_manager_app/global/custom_widgets/custom_app_layout.dart';
import 'package:task_manager_app/global/custom_widgets/custom_button.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text.dart';
import 'package:task_manager_app/global/custom_widgets/custom_text_form.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

// ignore: must_be_immutable
class AddNewTodoView extends GetView<AddNewTodoController> {
  AddNewTodoView({super.key});
  @override
  AddNewTodoController controller = Get.put(AddNewTodoController());
  @override
  Widget build(BuildContext context) {
    return CustomAppLayout(
      forWardWidget: Column(
        children: [
          0.1.sh.ph,
          Form(
            key: controller.todoKey,
            child: CustomTextForm(
              hint: "Todo description",
              controller: controller.todoController,
              validator: (value) =>
                  (value!.isEmpty) ? "the description couldn't be empty" : null,
              maxLines: 4,
            ),
          ),
          0.02.sh.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
            child: Row(
              children: [
                const CustomText(
                    textType: TextStyleType.body, text: 'is complete?:'),
                Obx(() => IconButton(
                    onPressed: () {
                      controller.isComlete.value = !controller.isComlete.value;
                    },
                    icon: controller.isComlete.value
                        ? Icon(Icons.check_box, color: AppColors.greenColor)
                        : Icon(Icons.check_box_outline_blank,
                            color: AppColors.secondDark))),
                const Spacer(),
                CustomButton(
                  text: 'Add',
                  onPressed: () {
                    if (controller.todoKey.currentState!.validate()) {
                      controller.addNew();
                    }
                  },
                  borderRadius: BorderRadius.circular(30.r),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
