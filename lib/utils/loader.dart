import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static void error([String message = "Une erreur est survenue"]) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        confirmBtnColor: Theme.of(Get.context!).colorScheme.primary,
        barrierDismissible: true,
        loopAnimation: true,
        text: message,
        title: "Erreur",
        type: CoolAlertType.error);
  }

  static void info(
      {String message = "Une erreur est survenue", VoidCallback? onCofirm}) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        confirmBtnColor: Theme.of(Get.context!).colorScheme.primary,
        barrierDismissible: true,
        loopAnimation: true,
        onConfirmBtnTap: onCofirm,
        text: message,
        title: "Info",
        type: CoolAlertType.info);
  }

  static void loading([String message = "Veuillez patienter"]) {
    CoolAlert.show(
        context: Get.context!,
        animType: CoolAlertAnimType.slideInLeft,
        backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
        barrierDismissible: false,
        loopAnimation: true,
        text: message,
        title: "Chargement...",
        type: CoolAlertType.loading);
  }

  static void confirm(
      {required VoidCallback onValidate,
      required VoidCallback onCancel,
      String message = "Voulez-vous vraiment procéder?"}) {
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
        text: message,
        title: "Confirmer",
        type: CoolAlertType.error);
  }

  static void close() {
    Get.back();
  }
}
