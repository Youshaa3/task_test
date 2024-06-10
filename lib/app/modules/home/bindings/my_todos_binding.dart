import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controllers/my_todos_controller.dart';

class MyTodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTodosController>(
      () => MyTodosController(),
    );
  }
}
