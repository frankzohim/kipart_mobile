import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/reset_password/reset_password_controller.dart';
import 'package:ki_part/utils/validators.dart';

class ResetPasswordPage extends GetWidget<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset password".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.otpController,
                  validator: Validators.otp,
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
                      labelText: "New Password".tr),
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
                      labelText: "Confirm password".tr),
                ),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorHor16,
                ElevatedButton(
                    onPressed: controller.resetPassword,
                    child:  Text("Reset".tr))
              ],
            );
          }),
        ),
      ),
    );
  }
}
