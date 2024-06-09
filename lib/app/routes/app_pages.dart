// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/bindings/add_new_binding.dart';
import 'package:task_manager_app/app/modules/home/bindings/all_todos_binding.dart';
import 'package:task_manager_app/app/modules/home/bindings/profile_binding.dart';
import 'package:task_manager_app/app/modules/home/bindings/search_random_binding.dart';
import 'package:task_manager_app/app/modules/home/views/add_new_todo_view.dart';
import 'package:task_manager_app/app/modules/home/views/all_todos_view.dart';
import 'package:task_manager_app/app/modules/home/views/profile_view.dart';
import 'package:task_manager_app/app/modules/home/views/search_random_view.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/login/view/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEW,
      page: () => AddNewTodoView(),
      binding: AddNewBinding(),
    ),
    GetPage(
      name: _Paths.TODOS,
      page: () => AllTodosView(),
      binding: AllTodosBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchRandomView(),
      binding: SearchRandomBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
