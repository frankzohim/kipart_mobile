import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/users.dart';

class TravellersInfosController extends GetxController {

  final travellers = Rx<List<Traveller>>(List.empty(growable: true));
  final formKey = GlobalKey<FormState>();
  final travel = Rx<TravelsModel?>(null);
  final dataSearch = Rx<SearchData?>(null);
  final agency = Rx<AgencesModel?>(null);
  final subAgency  = Rx<SubAgencyModel?>(null);
  final user  = Rx<UserModel?>(null);
  var trip = null;

  @override
  void onInit() {
    loadArguments();
    super.onInit();
  }

  loadArguments() async {
    print (Get.arguments['travel']);
    //travel.value = await TravelsModel.fromJson(Get.arguments['travel']);
    dataSearch.value = await Get.arguments['dataSearch'];
    user.value = await Get.arguments['user'];
    agency.value = await Get.arguments['agency'];
    subAgency.value = await Get.arguments['subAgency'];
    print(subAgency.value!.name);
  }

  @override
  void onReady() {
    SearchData searchData = Get.arguments["searchData"];
    trip = Get.arguments["travel"];

    for (var i = 0; i < num.parse(searchData.number_of_places); i++) {
      addOne();
    }
    //travel.value = Get.arguments["travel"];
    //travel.value = TravelsModel(Get.arguments["travel"]);
    super.onReady();
  }

  void addOne() {
    travellers.update((val) {
      val!.add(Traveller()
        ..cni = ""
        ..name = ""
        ..phone = ""
        ..type = "FEMME");
    });
  }

  removeItem(int index) {
    travellers.update((val) {
      val!.removeAt(index);
    });
  }

  onPhoneChanged(String value, int index) {
    travellers.value[index].phone = value;
  }

  onCNI(String value, int index) {
    travellers.value[index].cni = value;
  }

  onNameChanged(String value, int index) {
    travellers.value[index].name = value;
  }

  onTypeChanged(int i, int index) {
    travellers.update((val) {
      val![index].type = ["HOMME", "FEMME", "ENFANT"][i];
    });
  }

  void save() {
    if (!formKey.currentState!.validate()) return;
    Loader.loading();

    travellers.value[0].seatNumber = Random().nextInt(30);
    if(travellers.value[0].name == ""){
      travellers.value[0].name = user.value!.name;
    }

    if(travellers.value[0].phone == ""){
      travellers.value[0].phone = user.value!.phoneNumber;
    }

    print("in travellers");
    print(travellers.value[0].name);
    Api()
        .travelRepo
        .saveTravellers(trip["id"].toString(), travellers.value)
        .then((value) {
      Loader.close();
      Get.toNamed(Approutes.RECAP, arguments: {
        'travel': trip,
        "travellers": travellers.value,
        "paymentId": value["payment_id"],
        "searchData" : dataSearch.value,
        "user": user.value,
        "agency": agency.value,
        "subAgency": subAgency.value
      });
    }).catchError((err) {
      Loader.close();
      Loader.error(err.details);
    });
  }
}
