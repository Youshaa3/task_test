import 'package:get/get.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_all_todos_model.dart';
import 'package:task_manager_app/app/core/data/repositories/todos_docs_repository.dart';
import 'package:task_manager_app/app/core/services/base_controller.dart';

class AllTodosController extends BaseController {
  RxList<Todos> todosList = <Todos>[].obs;

  void getAllTodos() {
    errorMessage.value = '';
    success.value = false;

    TodosDocsRepository().getAll().then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
        success.value = true;
      } else if (value.$2 != null) {
        todosList.addAll(value.$2!.todos!);
        success.value = true;
      }
    });
  }

  @override
  void onInit() {
    // getAllTodos();
    super.onInit();
  }
}
