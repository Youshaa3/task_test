import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/routes/app_pages.dart';
import 'package:task_manager_app/mian_app/main_app_bindings.dart';
import 'package:task_manager_app/mian_app/mian_app_controller.dart';

class MainApp extends GetView<MainAppController> {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: "Task test",
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
        initialBinding: MainBindings(),
      ),
    );
  }
}
