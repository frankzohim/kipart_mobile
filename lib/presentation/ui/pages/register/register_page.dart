import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/register/register_controller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/validators.dart';

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
                      const TextSpan(text: "Créez un compte "),
                      TextSpan(
                          text: "et vivez pleinement l'expérience ",
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
            "Profitez de réservations et de remboursements plus rapides ainsi que des réductions.",
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
                    decoration: const InputDecoration(
                      labelText: "Noms et prénoms",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    controller: controller.emailController,
                    //validator: Validators.email,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  AppDimensions.serparatorVert8,
                  TextFormField(
                    controller: controller.phoneController,
                    validator: Validators.phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Téléphone",
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
                        labelText: "Mot de passe",
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
                        labelText: "confirmer mot de passe",
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                            onPressed: controller.change,
                            icon: Icon(controller.isVisble.value
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                  AppDimensions.serparatorVert16,
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: "En créant votre compte vous acceptez nos "),
                      TextSpan(
                          text: "conditions d’utilisation ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      const TextSpan(text: "et notre "),
                      TextSpan(
                          text: "politique de confidentialité",
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
              child: const Text("Créer un compte"))
        ]),
      ),
    );
  }
}
