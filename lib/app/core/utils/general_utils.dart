import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/data/repositories/shared_preference_repository.dart';
import 'package:task_manager_app/global/shared/app_colors.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

//HiveRepository get storage => Get.find<HiveRepository>();
SharedPrefreanceRepository get prefStorage =>
    Get.find<SharedPrefreanceRepository>();

void customLoader() {
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) {
      return Container(
        width: 130.w,
        height: 130.w,
        decoration: BoxDecoration(
            color: AppColors.mainDark.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.r)),
        child: SpinKitCircle(color: AppColors.mainBlue),
      );
    },
  );
}
