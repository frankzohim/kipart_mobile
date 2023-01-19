import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/buy_ticket/buy_ticket_page.dart';
import 'package:ki_part/presentation/ui/pages/recap/recap_controller.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/validators.dart';

class RecapPage extends GetWidget<RecapController> {
  const RecapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (a, b) => [
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Résumé de votre réservation"),
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
                              "Détails du voyage",
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
                            Text("AGENCE : "),
                            Text("${Get.arguments["subAgency"].name}".toUpperCase()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CLASSE : "),
                            Text("${Get.arguments["travel"]['classe']}".toUpperCase()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("HEURE : "),
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
                              "Passagers",
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
                                       Text("CNI: ${e.cni}"),
                                       Text("TEl.: ${e.phone}"),
                                    ],
                                  ),
                                ))
                            .toList(),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        AppDimensions.serparatorVert16,
                        Text(
                          "Votre facture",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text("Tickets (${Get.arguments["travellers"].length})"),
                             Text("${(num.tryParse(Get.arguments["travel"]['price']) ?? 0) * Get.arguments["travellers"].length} FCFA"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Frais Kipart"),
                            Text(Get.arguments['travel']['classe'] == "vip" ?
                            "${Get.arguments["travellers"].length * 500}  FCFA" : "${Get.arguments["travellers"].length * 300}  FCFA"),

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
                              const TextSpan(text: "(taxes comprises)")
                            ])),
                            Text(Get.arguments['travel']['classe'] == "vip" ?
                            "${Get.arguments["travellers"].length * 500 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length)} FCFA"
                                : "${Get.arguments["travellers"].length * 300 + (num.tryParse(Get.arguments["travel"]['price'])! * Get.arguments["travellers"].length)} FCFA" ,
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
                    child: const Text("Procéder au paiement"))
              ],
            ),
          )),
    );
  }

  _getCivitiy(String type) {
    switch (type.toLowerCase()) {
      case "femme":
        return "Mme.";
      case "homme":
        return "M.";
      default:
        return "";
    }
  }
}
