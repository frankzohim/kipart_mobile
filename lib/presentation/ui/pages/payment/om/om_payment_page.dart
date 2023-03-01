import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/payment/om/om_payment_controller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/validators.dart';
import 'package:ki_part/config/app_assets.dart';

class OMPaymentPage extends GetWidget<OMPaymentController> {
  const OMPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          HeaderWithImage(
              imagePath: AppAssets.connexion,
              child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "Enter your".tr+" "),
                      TextSpan(
                          text: "Orange Money number".tr,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                       TextSpan(text: " "+"to finalize the payment".tr),
                    ],
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                textAlign: TextAlign.center,
              )),
          AppDimensions.serparatorVert8,
          Text(
            'By clicking on "pay", you will receive instructions on your phone to complete the payment'.tr,
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

                  AppDimensions.serparatorVert16,

                ],
              ),
            ),

          AppDimensions.serparatorVert16,
          AppDimensions.serparatorVert16,
          ElevatedButton(
              onPressed :(){
                if (controller.phoneController.value.text.length != 9 ||  controller.phoneController.value.text[0]!='6') {
                  Get.snackbar(
                      "Error !!".tr,
                      "Numéro incorrect".tr,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.amber,
                      margin: EdgeInsets.all(10),
                      animationDuration: Duration(milliseconds: 2000),
                      isDismissible: true,
                      //dismissDirection: SnackDismissDirection.HORIZONTAL
                      forwardAnimationCurve: Curves.bounceInOut,
                      reverseAnimationCurve: Curves.bounceInOut,
                      overlayBlur: 5
                  );
                  return;
                }
                controller.payTicket(context);
              },
              child:  Text("Pay".tr + "("+Get.arguments["amount"].toString() +" FCFA)")
          )
        ]),

      ),
    );
  }
}
