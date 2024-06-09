import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controllers/add_new_todo_controller.dart';

class AddNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewTodoController>(
      () => AddNewTodoController(),
    );
  }
}
