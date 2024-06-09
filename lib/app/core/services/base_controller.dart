import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/enums/operation_type.dart';
import 'package:task_manager_app/app/core/enums/request_status.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';

class BaseController extends GetxController {
  RxBool success = false.obs;
  RxString errorMessage = ''.obs;
  Rx<RequestStatus> requestStatus = RequestStatus.defaultt.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;
  RxList<OperationType> listType = <OperationType>[].obs;

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.none}) async {
    requestStatus.value = RequestStatus.loading;
    operationType.add(type!);
    listType.add(type);
    await function;
    requestStatus.value = RequestStatus.defaultt;
    operationType.remove(type);
    listType.remove(type);
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
  }
}
