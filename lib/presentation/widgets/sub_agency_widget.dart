import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/travel_repo.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/utils/app_routes.dart';

class SubAgencyWidget extends GetWidget {
  final AgencesModel? agency;
  final SubAgencyModel? subAgency;
  final SearchData? dataSearch;

  const SubAgencyWidget({Key? key1, required this.agency, this.subAgency, this.dataSearch})
      : super(key: key1);

  @override
  Widget build(BuildContext context) {

    List<SubAgencyModel>? subAgencies = [];
    return InkWell(
      onTap: () async {
        print('onTap subagency');
        await TravelRepo.listTravelsAgency(agency!.id, dataSearch);
        await Get.toNamed(Approutes.AGENCY, arguments: [
          {"agency": agency},
          {"dataSearch": dataSearch},
          {"subAgency": subAgency}
        ]);
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              '${agency!.logo}',
              width: double.infinity,
              fit: BoxFit.cover,
              height: 120,
            ),
            AppDimensions.serparatorVert8,
            Text(
              "${subAgency!.name}",
            ),
            RatingBarIndicator(
              rating: 2.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
