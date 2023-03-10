import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';

class VerifyOTPController extends GetxController {
  late TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final phoneNumber = RxString("       ");

  @override
  void onReady() {
    phoneNumber.value = Get.arguments;
    super.onReady();
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  void verifyOTP() {
    if (!formKey.currentState!.validate()) return;
    Loader.loading();
    Api()
        .userRepo
        .validateOTP(otpController.text, phoneNumber.value)
        .then((value) {
      Loader.close();
      Loader.info(
        message:
            "Your account has been successfully verified. Please login".tr,
        onCofirm: () {
          Get.offAllNamed(
            Approutes.LOGIN,
            predicate: (route) => route.settings.name == Approutes.SEARCH,
          );
        },
      );
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details!);
    });
  }

  void resendCode() {
    Loader.loading();
    Api().userRepo.resendCode(phoneNumber.value).then((value) {
      Loader.close();
      Loader.info(message: "Your code has been sent to".tr +" "+ phoneNumber.value);
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details!);
    });
  }
}
