// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_colors.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/presentation/ui/pages/buy_ticket/buy_ticket_page.dart';
import 'package:ki_part/presentation/ui/pages/travellers_info/travellers_infos_page.dart';

class TravelWidget extends StatelessWidget {
  // final TravelsModel travel;
  final dynamic travel;

  const TravelWidget({Key? key, required this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('toto');
    print(travel);
    return InkWell(
      onTap: () {
        // Get.to(BuyTicketPage());
        Get.to(TravellersInfosPage(), arguments: travel);
      },
      child: Card(
        child: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${travel['departure']} - ${travel['arrival']}", // "${travel.departure} - ${travel.arrival}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.car_crash),
                        AppDimensions.serparatorHor8,
                        Text("Gros porteur")
                      ],
                    ),
                    Text(
                      "${travel['number_of_places']} places"
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.airplane_ticket),
                                AppDimensions.serparatorHor8,
                                Text(
                                    "${travel['classe']}") // Text("${travel.classe}")
                              ],
                            ),
                            AppDimensions.serparatorHor16,
                            AppDimensions.serparatorHor16,
                            Row(
                              children: [
                                Icon(Icons.history_toggle_off_sharp),
                                AppDimensions.serparatorHor8,
                                Text(
                                  "${travel['hours']}",
                                  style: Theme.of(context).textTheme.headline6,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.house),
                            AppDimensions.serparatorHor8,
                            Text(
                                "${travel['name']}", // Text("${travel.agence}",
                                style: TextStyle(fontWeight: FontWeight.w500))
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "${travel['price']}", // "${travel.prix}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "FCFA",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
