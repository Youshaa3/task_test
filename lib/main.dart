import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/core/utils/general_utils.dart';
import 'package:task_manager_app/mian_app/mian_app.dart';
import 'app/core/data/repositories/hive_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Get.put(HiveRepository());
  await storage.init();
  runApp(const MainApp());
}
