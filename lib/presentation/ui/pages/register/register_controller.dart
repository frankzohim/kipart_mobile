import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/utils/password_reveal.dart';

class RegisterController extends GetxController with PasswordReveal {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signUp() {
    if (!formKey.currentState!.validate()) return;
    Loader.loading();
    Api()
        .userRepo
        .register(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text)
        .then((value) {
      Loader.close();
      Get.offAndToNamed(Approutes.VERIFY_OTP, arguments: phoneController.text);
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
