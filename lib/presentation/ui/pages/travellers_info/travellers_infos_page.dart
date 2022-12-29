import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/utils/app_routes.dart';

class TravellersInfosPage extends StatelessWidget {
  const TravellersInfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (a, b) => [
                const SliverAppBar(
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Entrez vos informations"),
                  ),
                  expandedHeight: 120,
                )
              ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      height: 100,
                      width: 100,
                    ),
                    AppDimensions.serparatorHor8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom de l'agence",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        AppDimensions.serparatorVert8,
                        Row(
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.access_time_outlined),
                                AppDimensions.serparatorHor8,
                                Text(
                                  "O4:00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            AppDimensions.serparatorHor16,
                            AppDimensions.serparatorHor16,
                            Row(
                              children: const [
                                Icon(Icons.star),
                                AppDimensions.serparatorHor8,
                                Text("VIP"),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
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
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ToggleButtons(
                                        isSelected: [
                                          index == 1,
                                          index == 0,
                                          index == 2
                                        ],
                                        constraints: const BoxConstraints(
                                            minHeight: double.infinity),
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        renderBorder: true,
                                        borderColor: Colors.black,
                                        borderWidth: 1.5,
                                        borderRadius: BorderRadius.circular(10),
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: const Text('HOMME',
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text('FEMME',
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text('ENFANT',
                                                style: TextStyle(fontSize: 18)),
                                          ),
                                        ],
                                        onPressed: (int newIndex) {}),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              AppDimensions.serparatorVert8,
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Nom & prénoms"),
                              ),
                              if (index != 2) ...[
                                AppDimensions.serparatorVert8,
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "N° CNI"),
                                ),
                                AppDimensions.serparatorVert8,
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Téléphone"),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    )),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text("Ajouter une personne")),
                AppDimensions.serparatorVert16,
                AppDimensions.serparatorVert16,
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Approutes.RECAP);
                    },
                    child: const Text("Vérifier et payer")),
                AppDimensions.serparatorVert16,
              ],
            ),
          )),
    );
  }
}
