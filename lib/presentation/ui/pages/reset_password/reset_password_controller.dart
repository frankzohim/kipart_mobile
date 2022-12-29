import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/utils/password_reveal.dart';

class ResetPasswordController extends GetxController with PasswordReveal {
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onReady() {
    phoneController.text = Get.arguments;
    super.onReady();
  }

  void resetPassword() {
    if (!formKey.currentState!.validate()) return;

    Loader.loading();
    Api()
        .userRepo
        .resetPassword(phoneController.text, otpController.text,
            passwordController.text, confirmPasswordController.text)
        .then((value) {
      Loader.close();
      Loader.info(
        message:
            'Votre mot de passe a été reinitilisé. Veuillez vous conntecter',
        onCofirm: () {
          Get.back();
        },
      );
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
