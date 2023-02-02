import 'dart:convert';

import 'package:get/get.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/repo/travel_repo.dart';

class AgencyController extends GetxController
    with StateMixin<List<TravelsModel>> {
  final agency = Rx<AgencesModel?>(null);
  final subAgency  = Rx<SubAgencyModel?>(null);
  final dataSearch = Rx<SearchData?>(null);
  // AgencesModel agency;
  // SearchData dataSearch;
  // List<TravelsModel> travels = [];

  List travels = [];

  @override
  void onReady() async {
    await loadTravels();
    super.onReady();
  }

  @override
  void onInit() async{
    await loadArguments();
    super.onInit();
  }

  loadArguments() async {
    print('hello');
    agency.value = await Get.arguments[0]['agency'];
    print(agency.value!.name);
    dataSearch.value = await Get.arguments[1]['dataSearch'];
    subAgency.value = await Get.arguments[2]['subAgency'];
    print(subAgency.value!.name);
    /*print(dataSearch.value!.number_of_places);
    print('Hello world');*/
    await loadTravels();
    travels = TravelRepo.listTravels;
  }

  loadTravels() {
    change(null, status: RxStatus.loading());
    TravelRepo.listTravelsAgency(agency.value!.id, dataSearch.value)
        .then((value) async {
      // print(value);
      // var body = jsonEncode(value);
      travels = await value;
      await TravelRepo.listTravels;
      //print('valeur de la liste');
      //print(TravelRepo.listTravels);
      // change(value, status: RxStatus.success());
      return value;
    }).catchError((err) {
      change(null, status: RxStatus.error());
    });
  }
}