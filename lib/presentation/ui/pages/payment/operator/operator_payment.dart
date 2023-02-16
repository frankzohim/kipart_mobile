import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'operator_payment_controller.dart';

class OperatorPaymentPage extends GetWidget<OperatorPaymentController> {
  OperatorPaymentPage({super.key});

  final List<ListItem> operatorItems = [
    ListItem(1, "OM", "Orange Money", "assets/images/OM.png"),
    ListItem(2, "MoMo", "Mobile Money", "assets/images/MoMo.png"),
    ListItem(2, "CB", "Carte Bancaire", "assets/images/visa.png")
  ];

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
                "Choose payment method".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              )),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorHor8,
              DropdownButtonFormField(
                value: controller.operator.value,
                items: operatorItems.map((ListItem item) {
                  return DropdownMenuItem<String>(
                    value: item.sigle,
                    child: Row(
                      children: [
                        Image.asset(
                          item.image,
                          height: 35,
                          width: 50,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(right: 10, bottom: 10)),
                        Text(
                          item.name,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  );
                }).toList(),
                onChanged: controller.operator,
                decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.star),
                    labelText: "Payment method".tr),
              ),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              //   TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: "Nom sur la carte",
              //   ),
              // ),
              AppDimensions.serparatorVert8,
              AppDimensions.serparatorVert16,
              if (controller.operator.value == 'OM')
                ElevatedButton(
                    onPressed: () {}, child:  Text("Next".tr)),
              if (controller.operator.value == 'MoMo')
                ElevatedButton(
                    onPressed: () {}, child:  Text("Next".tr)),
              if (controller.operator.value == 'CB')
                ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed(Approutes.BANK_PAYMENT,
                        arguments: {
                          "amount": Get.arguments["amount"],
                          "paymentId": Get.arguments["paymentId"],
                          'travel': Get.arguments["travel"],
                          "travellers": Get.arguments["travellers"],
                          "subAgency": Get.arguments["subAgency"]
                        },
                      );
                    },
                    child:  Text("Next".tr)),
            ],
          );
        }),
      ),
    );
  }
}

class ListItem {
  int value;
  String sigle;
  String name;
  String image;
  ListItem(this.value, this.sigle, this.name, this.image);
}
