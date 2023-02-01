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
import 'package:ki_part/utils/loader.dart';

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
    List<SubAgencyModel>? subAgencies = [];
    return InkWell(
      onTap: () async {
        Loader.loading();
        Api().agencyRepo.getSubAgency(agency.id.toString())
            .then((value) async {
          Loader.close();
          //change(value, status: RxStatus.success());
          //print(value);
          print(value.length);
          subAgencies = [];
          value.forEach((element) {

            if(element.headquarters == dataSearch?.departure){
              subAgencies!.add(element);
              print(element.headquarters);
            }

          });
          print(subAgencies!.length);
          if(subAgencies!.length == 1){
            print(dataSearch!.classe);
             await TravelRepo.listTravelsAgency(agency.id, dataSearch);
             Get.toNamed(Approutes.AGENCY, arguments: [
              {"agency": agency},
              {"dataSearch": dataSearch},
               {"subAgency": subAgencies![0]}
            ]);
          }

          else{
            print(dataSearch!.classe);
            Get.toNamed(Approutes.PICK_SUB_AGENCY, arguments: [
              {"agency": agency},
              {"dataSearch": dataSearch},
              {"subAgencies": subAgencies}
            ]);
          }

        }).catchError((error) {
          print(error);
        });
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
              height: 130,
            ),
            AppDimensions.serparatorVert8,
            Text(
              "${agency.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            /*RatingBarIndicator(
              rating: 2.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15.0,
              direction: Axis.horizontal,
            ),*/
          ],
        ),
      ),
    );
  }
}
