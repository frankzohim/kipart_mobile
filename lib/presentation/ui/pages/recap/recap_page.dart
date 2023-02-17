import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/recap/recap_controller.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/utils/app_routes.dart';

class RecapPage extends GetWidget<RecapController> {
  const RecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (a, b) => [
                 SliverAppBar(
                  pinned: true,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Booking history".tr),
                  ),
                )
              ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BusWidget(
                  color: Theme.of(context).colorScheme.primary,
                  departureCity: "${Get.arguments["travel"]['departure']}",
                  arrivalDate: "${Get.arguments["travel"]['date']}",
                  destinationCity: "${Get.arguments["travel"]['arrival']}",
                  departureDate: "${Get.arguments["travel"]['date']}",
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
                AppDimensions.serparatorVert16,
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trip details".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                              ,
                            ),
                          ],
                        ),
                        AppDimensions.serparatorVert8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("AGENCY".tr +" : "),
                            Text("${Get.arguments["subAgency"].name}".toUpperCase()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("class".tr.toUpperCase() +" : "),
                            Text("${Get.arguments["travel"]['classe']}".toUpperCase()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("time".tr.toUpperCase() +" : "),
                            Text("${Get.arguments["travel"]['hours']}"),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        AppDimensions.serparatorVert16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Passengers".tr,
                              style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    ,
                            ),
                          ],
                        ),
                        AppDimensions.serparatorVert8,
                        ...Get.arguments["travellers"]
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Text("${_getCivitiy(e.type)} ${e.name}"),
                                       Text("N° NCI".tr +" : "+ e.cni),
                                       Text("Phone".tr.toUpperCase()+" : " + e.phone),
                                    ],
                                  ),
                                ))
                            .toList(),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        AppDimensions.serparatorVert16,
                        Text(
                          "Your bill".tr,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text("Number of tickets".tr),
                             Text("(${Get.arguments["travellers"].length})"),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              ///const TextSpan(text: "(taxes comprises)")
                            ])),
                            Text(Get.arguments['travel']['classe'] == "vip" ?
                            "${Get.arguments["travellers"].length * 1000 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length)} FCFA"
                                : "${Get.arguments["travellers"].length * 500 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length)} FCFA" ,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,

                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Approutes.OPERATOR_PAYMENT,
                        arguments: {
                          "amount": Get.arguments['travel']['classe'] == "vip" ?
                          Get.arguments["travellers"].length * 500 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length) :
                          Get.arguments["travellers"].length * 300 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length),
                          "paymentId": controller.paymentId,
                          'travel': controller.travel,
                          "travellers": controller.travellers.value,
                          "subAgency": controller.subAgency.value
                        },
                      );
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (c) => BuyTicketPage()));
                    },
                    child: Text("Proceed to payment".tr))
              ],
            ),
          )),
    );
  }

  _getCivitiy(String type) {
    switch (type.toLowerCase()) {
      case "femme":
        return "Mme.";
      case "woman":
        return "Mrs.";
      case "homme":
        return "Mr.";
      case "man":
        return "Mme.";
      default:
        return "";
    }
  }
}
