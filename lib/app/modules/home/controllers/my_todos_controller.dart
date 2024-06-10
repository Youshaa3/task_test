import 'package:task_manager_app/app/core/data/repositories/todos_docs_repository.dart';
import 'package:task_manager_app/app/core/services/base_controller.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';

class MyTodosController extends BaseController {
  Future<void> getTodosByUserId() async {
    errorMessage.value = '';
    success.value = false;

    await TodosDocsRepository()
        .getAllByUserId(userId: prefStorage.getLoginModel()!.id!)
        .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
        success.value = true;
      } else if (value.$2 != null) {
        todosList.clear();
        todosList.addAll(value.$2!.todos!);
        success.value = true;
      }
    });
  }

  @override
  void onInit() {
    getTodosByUserId();
    super.onInit();
  }
}
