import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/password_forgot/forgot_password_controller.dart';
import 'package:ki_part/utils/validators.dart';

class PasswordForgotPage extends GetWidget<ForgotPasswordController> {
  const PasswordForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot your password".tr),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                 Text(
                  "Enter your phone number below. You will receive a text message to reset your password",
                  textAlign: TextAlign.center,
                ),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                TextFormField(
                  controller: controller.phoneController,
                  validator: Validators.phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: " "+"Phone".tr,
                      prefixIcon: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(maxWidth: 70),
                        color: Theme.of(context).colorScheme.primary,
                        child: const Text("+237",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
                AppDimensions.serparatorVert16,
                ElevatedButton(
                    onPressed: controller.onPasswordForgot,
                    child:  Text("Send".tr))
              ],
            ),
          )),
    );
  }
}
