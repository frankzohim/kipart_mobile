import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/reset_password/reset_password_controller.dart';
import 'package:ki_part/utils/validators.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordPage extends GetWidget<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reinitialiser le mot de passe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  length: 6,
                  controller: controller.otpController,
                  validator: Validators.otp,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  submittedPinTheme: PinTheme(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(width: .5),
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor)),
                  focusedPinTheme: PinTheme(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .fillColor)),
                ),
                AppDimensions.serparatorVert16,
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isVisble.value,
                  validator: (v) => Validators.equalPasswords(
                      v, controller.confirmPasswordController.text),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: controller.change,
                        icon: Icon(controller.isVisble.value
                            ? Icons.visibility_off
                            : Icons.remove_red_eye),
                      ),
                      labelText: "Nouveau mot de passe"),
                ),
                AppDimensions.serparatorVert16,
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.isVisble.value,
                  validator: (v) => Validators.equalPasswords(
                      v, controller.passwordController.text),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: controller.change,
                          icon: Icon(controller.isVisble.value
                              ? Icons.visibility_off
                              : Icons.remove_red_eye)),
                      labelText: "Confirmer le mot de passe"),
                ),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorHor16,
                ElevatedButton(
                    onPressed: controller.resetPassword,
                    child: const Text("Valider"))
              ],
            );
          }),
        ),
      ),
    );
  }
}
