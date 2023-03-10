import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/verify_otp/verify_otp_controller.dart';
import 'package:ki_part/utils/validators.dart';
import 'package:get/get.dart';

class VerifyOTPPage extends GetWidget<VerifyOTPController> {
  const VerifyOTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verification code".tr)),
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
                        "Enter the 6-digit verification code we sent to the number".tr,
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
              child: TextFormField(
                controller: controller.otpController,
                validator: Validators.otp,
              ),
            ),
            AppDimensions.serparatorVert8,
            TextButton(
                onPressed: controller.resendCode,
                child:  Text(
                  "Resend code".tr,
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
            AppDimensions.serparatorVert16,
            AppDimensions.serparatorVert16,
            ElevatedButton(
                onPressed: controller.verifyOTP,
                child: Text("Check number".tr))
          ],
        ),
      ),
    );
  }
}
