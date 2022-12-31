import 'dart:convert';

import 'package:get/get.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/travel_repo.dart';

class AgencyController extends GetxController
    with StateMixin<List<TravelsModel>> {
  final agency = Rx<AgencesModel?>(null);
  final dataSearch = Rx<SearchData?>(null);
  // AgencesModel agency;
  // SearchData dataSearch;
  // List<TravelsModel> travels = [];

  List travels = [];

  @override
  void onReady() async {
    print('11111111');
    await loadTravels();
    super.onReady();
  }

  @override
  void onInit() {
    print('4444444');
    loadArguments();
    super.onInit();
  }

  loadArguments() async {
    print('333333"');
    agency.value = await Get.arguments[0]['agency'];
    dataSearch.value = await Get.arguments[1]['dataSearch'];
    await loadTravels();
    travels = TravelRepo.listTravels;
  }

  loadTravels() {
    print('22222222');
    change(null, status: RxStatus.loading());
    TravelRepo.listTravelsAgency(agency.value!.id, dataSearch.value)
        .then((value) async {
      // print(value);
      // var body = jsonEncode(value);
      travels = await value;
      await TravelRepo.listTravels;
      print('valeur de la liste');
      print(TravelRepo.listTravels);
      // change(value, status: RxStatus.success());
      return value;
    }).catchError((err) {
      change(null, status: RxStatus.error());
    });
  }
}