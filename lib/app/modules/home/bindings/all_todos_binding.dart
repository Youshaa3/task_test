import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controllers/all_todos_controller.dart';

class AllTodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTodosController>(
      () => AllTodosController(),
    );
  }
}
