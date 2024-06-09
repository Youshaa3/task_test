import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/app/modules/home/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("profile");
  }
}
