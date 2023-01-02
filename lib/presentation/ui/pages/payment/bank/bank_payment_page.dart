import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/payment/bank/bank_payment_conteroller.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';

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
                "Details de votre carte",
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
                controller: controller.nomCard,
                decoration: const InputDecoration(
                  labelText: "Nom sur la carte",
                ),
              ),
              AppDimensions.serparatorVert8,
              TextFormField(
                controller: controller.numCard,
                decoration:
                    const InputDecoration(labelText: "Numéro de la carte"),
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
                      dateLabelText: "Date d'expiration",
                      onChanged: controller.dateExp,
                      validator: (val) {
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Date d'expiration",
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                    ),
                  ),
                  AppDimensions.serparatorHor8,
                  Expanded(
                    child: TextFormField(
                      controller: controller.cvvCard,
                      decoration: const InputDecoration(labelText: "CVV"),
                    ),
                  ),
                ],
              ),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              ElevatedButton(
                  onPressed: () {
                    controller.payTicket(context);
                  },
                  child: Text("Payer (${Get.arguments["amount"] } FCFA)"))
            ],
          );
        }),
      ),
    );
  }
}
