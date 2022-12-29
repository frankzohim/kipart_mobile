import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/buy_ticket/buy_ticket_page.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/utils/app_routes.dart';

class RecapPage extends StatelessWidget {
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
                  departureCity: "Douala",
                  arrivalDate: "Sam. 10 dec.",
                  destinationCity: "Yaounde",
                  departureDate: "Sam. 10 dec.",
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
                              "Coordonnées des passagers",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            InkWell(
                              child: Text(
                                "Modifier",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                        AppDimensions.serparatorVert8,
                        ...[0, 1, 2]
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("M. Noms & prénoms"),
                                      const Text("CNI: XXXXXXXXXX"),
                                      const Text("TEl.: +2376XXXXXXXX"),
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
                            const Text("Tickets (3)"),
                            const Text("8000 FCFA"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Frais Kipart"),
                            const Text("500 FCFA"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Reduction"),
                            const Text("0 FCFA"),
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
                            Text("8000 FCFA",
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appliquer une réduction (optionnel)",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        AppDimensions.serparatorVert8,
                        Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: "Code de reduction"),
                              ),
                            ),
                            AppDimensions.serparatorHor16,
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 77, 77, 77)),
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 8),
                                      ),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)))),
                                  onPressed: () {},
                                  child: const Text("Appliquer")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Approutes.OPERATOR_PAYMENT);
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (c) => BuyTicketPage()));
                    },
                    child: const Text("Procéder au paiement"))
              ],
            ),
          )),
    );
  }
}
