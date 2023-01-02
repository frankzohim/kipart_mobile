import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/presentation/ui/pages/travellers_info/travellers_infos_controller.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/validators.dart';

class TravellersInfosPage extends GetWidget<TravellersInfosController> {
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
            child: Obx(() {
              return controller.travel.value != null
                  ? Container()
                  : Column(
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
                            "${Get.arguments["travel"]['name']}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          AppDimensions.serparatorVert8,
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time_outlined),
                                  AppDimensions.serparatorHor8,
                                  Text(
                                    "${Get.arguments["travel"]['hours']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              AppDimensions.serparatorHor16,
                              AppDimensions.serparatorHor16,
                              Row(
                                children: [
                                  const Icon(Icons.star),
                                  AppDimensions.serparatorHor8,
                                  Text("${Get.arguments["travel"]['classe'].toString().toUpperCase()}"),
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
                    departureCity: "${Get.arguments["travel"]['departure']}",
                    arrivalDate: "${Get.arguments["travel"]['date']}",
                    destinationCity: "${Get.arguments["travel"]['arrival']}",
                    departureDate: "${Get.arguments["travel"]['date']}",
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  AppDimensions.serparatorVert16,
                  Form(
                      key: controller.formKey,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: controller.travellers.value.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final traveller =
                            controller.travellers.value[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: ToggleButtons(
                                                isSelected: [
                                                  traveller.type ==
                                                      "HOMME",
                                                  traveller.type ==
                                                      "FEMME",
                                                  traveller.type ==
                                                      "ENFANT",
                                                ],
                                                constraints:
                                                const BoxConstraints(
                                                    minHeight: double
                                                        .infinity),
                                                textStyle:
                                                const TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                                renderBorder: true,
                                                borderColor: Colors.black,
                                                borderWidth: 1.5,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        12),
                                                    child: const Text(
                                                        'HOMME',
                                                        style: TextStyle(
                                                            fontSize:
                                                            18)),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        12),
                                                    child: Text('FEMME',
                                                        style: TextStyle(
                                                            fontSize:
                                                            18)),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        12),
                                                    child: Text('ENFANT',
                                                        style: TextStyle(
                                                            fontSize:
                                                            18)),
                                                  ),
                                                ],
                                                onPressed: (i) =>
                                                    controller
                                                        .onTypeChanged(
                                                        i, index))),
                                        IconButton(
                                            onPressed: () => controller
                                                .removeItem(index),
                                            icon: const Icon(Icons.close))
                                      ],
                                    ),
                                    AppDimensions.serparatorVert8,
                                    TextFormField(
                                      validator: Validators.length,
                                      onChanged: (value) => controller
                                          .onNameChanged(value, index),
                                      decoration: const InputDecoration(
                                          labelText: "Nom & prénoms"),
                                    ),
                                    if (traveller.type != "ENFANT") ...[
                                      AppDimensions.serparatorVert8,
                                      TextFormField(
                                        validator: Validators.length,
                                        onChanged: (value) => controller
                                            .onCNI(value, index),
                                        decoration: const InputDecoration(
                                            labelText: "N° CNI"),
                                      ),
                                      AppDimensions.serparatorVert8,
                                      TextFormField(
                                        validator: Validators.phone,
                                        onChanged: (value) => controller
                                            .onPhoneChanged(value, index),
                                        decoration: const InputDecoration(
                                            labelText: "Téléphone"),
                                        keyboardType: TextInputType.number,
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      })),
                  AppDimensions.serparatorVert16,
                  AppDimensions.serparatorVert16,
                  TextButton.icon(
                      onPressed: controller.addOne,
                      icon: const Icon(Icons.add),
                      label: const Text("Ajouter une personne")),
                  AppDimensions.serparatorVert16,
                  AppDimensions.serparatorVert16,
                  ElevatedButton(
                      onPressed: controller.save,
                      child: const Text("Vérifier et payer")),
                  AppDimensions.serparatorVert16,
                ],
              );
            }),
          )),
    );
  }
}
