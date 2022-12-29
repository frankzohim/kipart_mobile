import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/verify_otp/verify_otp_controller.dart';
import 'package:ki_part/utils/validators.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPPage extends GetWidget<VerifyOTPController> {
  const VerifyOTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Code de vérification")),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text.rich(
                TextSpan(
                    text:
                        "Entrez le code de vérification à 6 chiffres que nous vous avons envoyé au numero ",
                    children: [
                      TextSpan(
                          text:
                              "${controller.phoneNumber.value.replaceRange(2, 7, "XXXXX")}.",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ))
                    ]),
                textAlign: TextAlign.center,
              );
            }),
            AppDimensions.serparatorVert16,
            AppDimensions.serparatorVert16,
            AppDimensions.serparatorVert16,
            Form(
              key: controller.formKey,
              child: Pinput(
                controller: controller.otpController,
                length: 6,
                validator: Validators.otp,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                submittedPinTheme: PinTheme(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.circular(6),
                        color:
                            Theme.of(context).inputDecorationTheme.fillColor)),
                focusedPinTheme: PinTheme(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Theme.of(context).inputDecorationTheme.fillColor)),
              ),
            ),
            AppDimensions.serparatorVert8,
            TextButton(
                onPressed: controller.resendCode,
                child: const Text(
                  "Renvoyer le code",
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
            AppDimensions.serparatorVert16,
            AppDimensions.serparatorVert16,
            ElevatedButton(
                onPressed: controller.verifyOTP,
                child: const Text("Verifier le numéro"))
          ],
        ),
      ),
    );
  }
}
