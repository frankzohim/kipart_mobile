import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/payment/payment_page.dart';
import 'package:ki_part/presentation/widgets/car_widget.dart';
import 'package:ki_part/utils/app_routes.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deco = BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text("Selectionner la place"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: deco.copyWith(color: Colors.grey),
                        ),
                        const Text("Vide")
                      ],
                    ),
                    AppDimensions.serparatorVert8,
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: deco.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        const Text("Votre place")
                      ],
                    ),
                    AppDimensions.serparatorVert8,
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: deco,
                        ),
                        const Text("Occupé")
                      ],
                    ),
                  ],
                ),
              ),
              const CarWidget(),
              // Divider(
              //   thickness: 1,
              // ),
              // Text("Bus de 70 places"),
              // CarWidget(
              //   type: CartType.gp,
              // ),

              AppDimensions.serparatorVert16,
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text("Ignorer"))),
                  AppDimensions.serparatorHor16,
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Approutes.PAYMENT);
                          },
                          child: const Text("SUIVANT"))),
                ],
              )
            ],
          )),
    );
  }
}
