import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static void error([String message = "An error has occurred"]) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        confirmBtnColor: Theme.of(Get.context!).colorScheme.primary,
        barrierDismissible: true,
        loopAnimation: true,
        text: message.tr,
        title: "Error".tr,
        type: CoolAlertType.error);
  }

  static void info(
      {String message = "An error has occurred", VoidCallback? onCofirm}) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        confirmBtnColor: Theme.of(Get.context!).colorScheme.primary,
        barrierDismissible: true,
        loopAnimation: true,
        onConfirmBtnTap: onCofirm,
        text: message.tr,
        title: "Info",
        type: CoolAlertType.info);
  }

  static void loading([String message = "Please wait"]) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        barrierDismissible: false,
        loopAnimation: true,
        text: message.tr,
        title: "Loading...".tr,
        type: CoolAlertType.loading);
  }

  static void confirm(
      {required VoidCallback onValidate,
      required VoidCallback onCancel,
      String message = "Do you really want to proceed?"}) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInUp,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        barrierDismissible: false,
        loopAnimation: true,
        showCancelBtn: true,
        onCancelBtnTap: onCancel,
        onConfirmBtnTap: onValidate,
        confirmBtnColor: Theme.of(Get.context!).colorScheme.primary,
        text: message.tr,
        title: "Confirm".tr,
        type: CoolAlertType.error);
  }

  static void close() {
    Get.back();
  }
}
