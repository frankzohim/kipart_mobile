import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onPasswordForgot() {
    if (!formKey.currentState!.validate()) return;
    Loader.loading();
    Api()
        .userRepo
        .requestCodePasswordForgot(phoneController.text)
        .then((value) {
      Loader.close();
      Get.offAndToNamed(Approutes.RESET_PASSWORD,
          arguments: phoneController.text);
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }
}
