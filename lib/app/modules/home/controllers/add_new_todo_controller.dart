import 'package:flutter/widgets.dart';
import 'package:task_manager_app/app/core/data/repositories/todos_docs_repository.dart';
import 'package:task_manager_app/app/core/enums/message_type.dart';
import 'package:task_manager_app/app/core/services/base_controller.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/global/custom_widgets/custom_toast.dart';

class AddNewTodoController extends BaseController {
  TextEditingController todoController = TextEditingController();
  GlobalKey<FormState> todoKey = GlobalKey();
  void addNew() {
    success.value = true;

    runFullLoadingFutureFunction(
        function: TodosDocsRepository()
            .addNew(
                userId: storage.getLoginModel.id!,
                todo: todoController.text,
                completed: completed.value)
            .then((value) {
      if (value.$1 != null) {
        errorMessage.value = value.$1!;
        success.value = false;
      } else if (value.$2 != null) {
        CustomToast.showMessage(
            message: 'Added successfuly', messagetype: MessageType.success);
      }
    }));
  }

  @override
  void onInit() {
    completed.value = false;
    super.onInit();
  }
}
