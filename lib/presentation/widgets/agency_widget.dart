import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/repo/travel_repo.dart';
import 'package:ki_part/utils/app_routes.dart';

class AgencyWidget extends GetWidget {
  final AgencesModel agency;
  final SearchData? dataSearch;

  const AgencyWidget({Key? key, required this.agency, this.dataSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*print('in agency widget');
    print(dataSearch?.departure);
    print(agency.name);*/
    return InkWell(
      onTap: () async {
        await TravelRepo.listTravelsAgency(agency.id, dataSearch);
        await Get.toNamed(Approutes.AGENCY, arguments: [
          {"agency": agency},
          {"dataSearch": dataSearch}
        ]);
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              '${agency.logo}',
              width: double.infinity,
              fit: BoxFit.cover,
              height: 100,
            ),
            AppDimensions.serparatorVert8,
            Text(
              "${agency.name}",
              style: Theme.of(context).textTheme.headline6,
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
