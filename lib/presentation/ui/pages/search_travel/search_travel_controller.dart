import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/city.dart';
import 'package:ki_part/data/models/hours.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'dart:convert';
import 'package:ki_part/utils/loader.dart';

class SearchTravelController extends GetxController
    with StateMixin<List<dynamic>> {
  List<CityModel> villes = [];
  List<CityModel> listVillesBack = [];
  List<HoursModel> heures = [];

  final formKey = GlobalKey<FormState>();

  final typeTravel = "Aller simple".obs;
  final departure = "Douala".obs;
  final arrival = "Yaoundé".obs;
  var cityList = [];
  final classeTravel = "Classique".obs;
  final dateDepart = "".obs;
  final heureDepart = "07:30".obs;
  final dateRetour = "".obs;
  final heureRetour = "07:30".obs;
  final TextEditingController nbrePassagerController =
      TextEditingController(text: "1");
  final TextEditingController typeAheadAllerController =
      TextEditingController();
  final TextEditingController typeAheadRetourController =
      TextEditingController();

  final messageErrorDepart = ''.obs;
  final messageErrorArrive = ''.obs;

  @override
  void onInit() async {
    await loadTown();
    super.onInit();
  }

  loadTown() {
    change(null, status: RxStatus.loading());
    Future.wait([
      Api().travelRepo.listTown(),
      Api().travelRepo.listHours(),
    ]).then((List<dynamic> value) async {
      /*print('Hi there');
      print(value);*/
      villes = await value[0];
      var list = [];
      villes.forEach((element) {
        list.add(element.ville);
      });
      cityList = list;
      listVillesBack = await value[0];
      heures = await value[1];
      change(value, status: RxStatus.success());
      return value;
    }).catchError((err) {
      change(null, status: RxStatus.error());
    });
  }

  initSearch() {
    if (!formKey.currentState!.validate()) return;
    SearchData dataSearch = SearchData(
        type: typeTravel.value,
        departure: departure.value,
        arrival: arrival.value,
        dateDeparture: dateDepart.value,
        departure_time: heureDepart.value,
        dateArrival:
            (dateRetour.value != "" && typeTravel.value != "Aller simple")
                ? dateRetour.value
                : null,
        heureArrival:
            (heureRetour.value != "" && typeTravel.value != "Aller simple")
                ? heureRetour.value
                : null,
        number_of_places: nbrePassagerController.text,
        classe: classeTravel.value);
        //Loader.loading();
    Get.toNamed(Approutes.PICK_AGENCY, arguments: dataSearch);
    //Loader.close();
    // } else {
    //   return;
    // }
    // }
  }
}
