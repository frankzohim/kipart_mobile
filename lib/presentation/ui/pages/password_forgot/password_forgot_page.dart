import 'package:flutter/material.dart';
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
        title: const Text("Mot de passe oublié"),
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
                const Text(
                  "Veuillez indiquez votre numéro de téléphone dans le champs ci dessous. Vous recevrez un sms pour reinitialiser votre mot depasse",
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
                      labelText: "Téléphone",
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
                    child: const Text("Envoyer"))
              ],
            ),
          )),
    );
  }
}
