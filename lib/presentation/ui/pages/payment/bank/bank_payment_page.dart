import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/payment/bank/bank_payment_conteroller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/validators.dart';

class BankPaymentPage extends GetWidget<BankPaymentController> {
  const BankPaymentPage({super.key});

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
        child: Obx(() {
          return Column(
            children: [
              HeaderWithImage(
                  child: Text(
                "Card\'s details".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              )),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              // CardFormField(
              //   style: CardFormStyle(
              //       placeholderColor: Colors.orange, textColor: Colors.black),
              //   enablePostalCode: false,
              //   // onCardChanged: controller.card
              //   // (card) {
              //   //   setState(() {
              //   //     _card = card;
              //   //     print(card);
              //   //   });
              //   // },
              // ),
              TextFormField(
                validator: Validators.length,
                controller: controller.nomCard,
                decoration: InputDecoration(
                  labelText: "Name on the card".tr,
                ),
              ),
              AppDimensions.serparatorVert8,
              TextFormField(
                validator: Validators.card,
                controller: controller.numCard,
                decoration:
                     InputDecoration(labelText: "Card number".tr),
              ),
              AppDimensions.serparatorVert8,
              Row(
                children: [
                  Expanded(
                    child: DateTimePicker(
                      initialValue: controller.dateExp.value,
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 360 * 6)),
                      dateLabelText: "Expiration date".tr,
                      onChanged: controller.dateExp,
                      validator: (val) {
                        return null;
                      },
                      decoration:  InputDecoration(
                          labelText: "Expiration date".tr,
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                    ),
                  ),
                  AppDimensions.serparatorHor8,
                  Expanded(
                    child: TextFormField(
                      validator: Validators.cvv,
                      controller: controller.cvvCard,
                      decoration: const InputDecoration(labelText: "CVC"),
                    ),
                  ),
                ],
              ),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              ElevatedButton(
                  onPressed: () {

                    if (controller.nomCard.value.text == '') {
                      Get.snackbar(
                          "Error !!".tr,
                          "Please enter your name on the card".tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.amber,
                          margin: EdgeInsets.all(10),
                          animationDuration: Duration(milliseconds: 1000),
                          isDismissible: true,
                          //dismissDirection: SnackDismissDirection.HORIZONTAL
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.bounceInOut,
                          overlayBlur: 5
                      );
                      return;
                    }

                    if (controller.numCard.value.text == '' || !controller.numCard.value.text.isNumericOnly || controller.numCard.value.text.length != 16) {
                      Get.snackbar(
                          "Error !!".tr,
                          "Incorrect credit card number".tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.amber,
                          margin: EdgeInsets.all(10),
                          animationDuration: Duration(milliseconds: 1000),
                          isDismissible: true,
                          //dismissDirection: SnackDismissDirection.HORIZONTAL
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.bounceInOut,
                          overlayBlur: 5
                      );
                      return;
                    }

                    if (controller.dateExp.value == '') {
                      Get.snackbar(
                          "Error !!".tr,
                          "Please fill in the date".tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.amber,
                          margin: EdgeInsets.all(10),
                          animationDuration: Duration(milliseconds: 1000),
                          isDismissible: true,
                          //dismissDirection: SnackDismissDirection.HORIZONTAL
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.bounceInOut,
                          overlayBlur: 5
                      );
                      return;
                    }

                    if (controller.cvvCard.value.text == '' || !controller.cvvCard.value.text.isNumericOnly || controller.cvvCard.value.text.length != 3) {
                      Get.snackbar(
                          "Error !!".tr,
                          "Incorrect CVC number".tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.amber,
                          margin: EdgeInsets.all(10),
                          animationDuration: Duration(milliseconds: 1000),
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
                  child: Text("Pay".tr + "("+Get.arguments["amount"].toString() +" FCFA)"))
            ],
          );
        }),
      ),
    );
  }
}
