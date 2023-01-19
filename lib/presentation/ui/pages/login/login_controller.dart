import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/models/exception.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/services/user_service.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/utils/password_reveal.dart';

class LoginController extends GetxController with PasswordReveal {
  final formKey = GlobalKey<FormState>();

  final remember = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() {
    if (!formKey.currentState!.validate()) return;
    Loader.loading();
    Api()
        .userRepo
        .login(phoneController.text, passwordController.text)
        .then((value) {
      Loader.close();
      Get.find<UserService>().login(value, remember.value);
      Get.back(result: true);
    }).catchError((error) {
      Loader.close();
      if (error is MyException && error.code == 401) {
        Get.toNamed(Approutes.VERIFY_OTP, arguments: phoneController.text);
        return;
      }
      Loader.error(error.details!);
    });
  }

  @override
  void onClose() {
    /*phoneController.dispose();
    passwordController.dispose();*/
    super.onClose();
  }
}
