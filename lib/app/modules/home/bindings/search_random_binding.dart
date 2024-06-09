import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controllers/search_random_controller.dart';

class SearchRandomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRandomController>(
      () => SearchRandomController(),
    );
  }
}
