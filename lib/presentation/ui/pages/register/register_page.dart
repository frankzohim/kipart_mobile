import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/register/register_controller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/validators.dart';
import 'package:ki_part/data/models/brandAmbassador.dart';

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({super.key});

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          HeaderWithImage(
              imagePath: AppAssets.connexion,
              child: Text.rich(
                TextSpan(
                    children: [
                       TextSpan(text: "Create an account".tr+" "),
                      TextSpan(
                          text: "and fully live the experience".tr,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      const TextSpan(text: "Ki"),
                      TextSpan(
                          text: "PART",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                    ],
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                textAlign: TextAlign.center,
              )),
          AppDimensions.serparatorVert8,
          Text(
            "Enjoy faster reservations and refunds as well as discounts.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          AppDimensions.serparatorVert16,
          AppDimensions.serparatorVert16,
          Obx(() {
            return Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    validator: (v) =>
                        Validators.length(v, maxLength: 30, minLength: 1),
                    decoration: InputDecoration(
                      labelText: "Lastname and firstname".tr,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    controller: controller.emailController,
                    validator: Validators.email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    controller: controller.phoneController,
                    validator: Validators.phone,
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      labelText: "Phone".tr,
                      hintText: "6XXXXXXXX",
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: !controller.isVisble.value,
                    validator: (v) => Validators.equalPasswords(
                        v, controller.confirmPasswordController.text),
                    decoration: InputDecoration(
                        labelText: "Password".tr,
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: controller.change,
                            icon: Icon(controller.isVisble.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    obscureText: !controller.isVisble.value,
                    controller: controller.confirmPasswordController,
                    validator: (v) => Validators.equalPasswords(
                        v, controller.passwordController.text),
                    decoration: InputDecoration(
                        labelText: "Confirm password".tr,
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: controller.change,
                            icon: Icon(controller.isVisble.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                  AppDimensions.serparatorVert8,
                  DropdownButtonFormField(
                      value: controller.brandAmbassador.value,
                      decoration: InputDecoration(
                          labelText: "Brand Girl",
                          prefixIcon:
                          Icon(Icons.supervised_user_circle)),
                      items: controller.brandAmbassadors.value
                          .map((BrandAmabssadorModel e) => DropdownMenuItem(
                        value: e.name,
                        child: Text(e.name!),
                      ))
                          .toList(),
                      onChanged: controller.brandAmbassador),
                  AppDimensions.serparatorVert16,
                  Text.rich(
                    TextSpan(children: [
                       TextSpan(
                          text: "By creating your account you agree to our".tr),
                      TextSpan(
                          text: "terms of use".tr,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                       TextSpan(text: "and our".tr),
                      TextSpan(
                          text: "privacy-policy".tr,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary))
                    ], style: Theme.of(context).textTheme.bodySmall),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }),
          AppDimensions.serparatorVert16,
          AppDimensions.serparatorVert16,
          ElevatedButton(
              onPressed: controller.signUp,
              child:  Text("Create an account".tr))
        ]),
      ),
    );
  }
}
