import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';

class TravellersInfosController extends GetxController {

  final travellers = Rx<List<Traveller>>(List.empty(growable: true));
  final formKey = GlobalKey<FormState>();
  final travel = Rx<TravelsModel?>(null);

  @override
  void onReady() {
    SearchData searchData = Get.arguments["searchData"];
    print(Get.arguments["travel"]);
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
    //Loader.loading();

    travellers.value[0].seatNumber = Random().nextInt(30);

    Get.toNamed(Approutes.RECAP, arguments: {
      'travel': Get.arguments["travel"],
      "travellers": travellers.value,
      "searchData" : Get.arguments["searchData"]
    });

    /*Api()
        .travelRepo
        .saveTravellers(travel.value!.id!, travellers.value)
        .then((value) {
      Loader.close();
      Get.toNamed(Approutes.RECAP, arguments: {
        'travel': travel.value,
        "travellers": travellers.value,
        "paymentId": value["payment_id"]
      });
    }).catchError((err) {
      Loader.close();
      Loader.error(err.details);
    });*/
  }
}
