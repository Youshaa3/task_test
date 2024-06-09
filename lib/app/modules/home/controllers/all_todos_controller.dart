import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/data/models/apis/todos_docs_models/get_all_todos_model.dart';
import 'package:task_manager_app/app/core/data/repositories/todos_docs_repository.dart';
import 'package:task_manager_app/app/core/enums/message_type.dart';
import 'package:task_manager_app/app/core/services/base_controller.dart';
import 'package:task_manager_app/global/custom_widgets/custom_toast.dart';

class AllTodosController extends BaseController {
  RxList<Todos> todosList = <Todos>[].obs;
  TextEditingController todoController = TextEditingController();
  int total = 0;
  int limit = 30;
  int skip = 0;

  Future<void> getAllTodos() async {
    errorMessage.value = '';
    success.value = false;

    await TodosDocsRepository().getAll().then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
        success.value = true;
      } else if (value.$2 != null) {
        todosList.clear();
        todosList.addAll(value.$2!.todos!);
        total = value.$2!.total!;
        success.value = true;
        limit += 30;
        skip++;
      }
    });
  }

  String cutText(String text) {
    if (text.length > 19) {
      return text.substring(0, 20);
    }
    return text;
  }

  void deleteTodo(int id) {
    runFullLoadingFutureFunction(
        function: TodosDocsRepository().delete(id: id).then((value) {
      if (value.$1 != null) {
        CustomToast.showMessage(
            message: value.$1!, messagetype: MessageType.rejected);
      } else if (value.$2 != null) {
        todosList.removeWhere((todo) => todo.id == id);
        Get.back();
      }
    }));
  }

  void editTodo(int id) {
    final todo = todosList.firstWhereOrNull((todo) => todo.id == id);
    if (todo != null) {
      todo.todo == todoController.text && todo.completed == completed.value
          ? CustomToast.showMessage(
              message: 'update something', messagetype: MessageType.warning)
          : runFullLoadingFutureFunction(
              function: TodosDocsRepository()
                  .update(id: id, completed: completed.value)
                  .then((value) {
              if (value.$1 != null) {
                CustomToast.showMessage(
                    message: value.$1!, messagetype: MessageType.rejected);
              } else if (value.$2 != null) {
                todo.todo = todoController.text;
                todo.completed = completed.value;

                todosList.refresh();
                CustomToast.showMessage(
                    message: 'task is updated',
                    messagetype: MessageType.success);
              }
            }));
    }
  }

  ScrollController scrollController = ScrollController();

  void listenToScrollPosition() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      todosList.length != total ? getAllTodosWithPagenation() : null;
    }
  }

  Future<void> getAllTodosWithPagenation() async {
    await TodosDocsRepository()
        .getLimitAndSkip(limit: limit, skip: skip)
        .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
        success.value = true;
      } else if (value.$2 != null) {
        todosList.addAll(value.$2!.todos!);
        total = value.$2!.total!;
        success.value = true;
        limit += 30;
        skip++;
      }
    });
  }

  @override
  void onInit() {
    getAllTodos();
    scrollController.addListener(listenToScrollPosition);
    super.onInit();
  }
}
