// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/login/login_controller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/app_routes.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              HeaderWithImage(
                  imagePath: AppAssets.connexion,
                  child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: "Login".tr),
                          TextSpan(
                              text: "and fully live the experience".tr,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          TextSpan(text: "Ki"),
                          TextSpan(
                              text: "PART",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ],
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    textAlign: TextAlign.center,
                  )),
              AppDimensions.serparatorVert8,
              Text(
                "Enjoy faster reservations and refunds as well as discounts.".tr,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone".tr,
                          hintText: "6XXXXXXXX",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      AppDimensions.serparatorVert8,
                      Obx(() {
                        return TextFormField(
                          controller: controller.passwordController,
                          obscureText: !controller.isVisble.value,
                          decoration: InputDecoration(
                            labelText: "Password".tr,
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                                onPressed: controller.change,
                                icon: Icon(controller.isVisble.value
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye)),
                          ),
                        );
                      }),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Approutes.PASSWORD_FORGOT);
                          },
                          child: Text(
                            "Forgot your password?".tr,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                          )),
                      Obx(() {
                        return CheckboxListTile(
                            value: controller.remember.value,
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: Text("Remember me".tr),
                            onChanged: controller.remember);
                      })
                    ],
                  )),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              ElevatedButton(
                  onPressed: controller.login, child: Text("Sign in".tr)),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              Text(
                "No account?".tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Approutes.SIGNUP);
                  },
                  child: Text(
                    "Create an account".tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary),
                  )),
            ],
          )),
    );
  }
}
