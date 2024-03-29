import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/users.dart';
import 'package:ki_part/data/models/searchData.dart';

class RecapController extends GetxController {
  final travellers = Rx<List<Traveller>>([]);
  final dataSearch = Rx<SearchData?>(null);
  final agency = Rx<AgencesModel?>(null);
  final subAgency  = Rx<SubAgencyModel?>(null);
  final user  = Rx<UserModel?>(null);
  int? total = 0;
  var KipartFees = 0.obs;
  dynamic travel;

  final couponController = TextEditingController();
  final couponFormKey = GlobalKey<FormState>();
  final reduction = 0.obs;

  late String paymentId;
  @override
  void onReady() {

    super.onReady();
  }

  @override
  onInit() async{
    await loadArguments();
  }

  loadArguments() async{
    print(Get.arguments["paymentId"]);
    travellers.value = await Get.arguments["travellers"];
    dataSearch.value = await Get.arguments['dataSearch'];
    user.value = await Get.arguments['user'];
    agency.value = await Get.arguments['agency'];
    subAgency.value = await Get.arguments['subAgency'];
    print(Get.arguments["travel"]);
    travel = await Get.arguments["travel"];
    paymentId = (await Get.arguments["paymentId"]).toString();
    if(travel['classe'] == "classique"){
      KipartFees = (300 * travellers.value.length) as RxInt;
    }
    else
      KipartFees = (500 * travellers.value.length) as RxInt;

    total = int.parse(Get.arguments["travel"]['price']) * int.parse(Get.arguments["travellers"].length);
    print(paymentId);
    print(travel);
    print(travellers.value.length);
  }

  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }

  num getTotalAmount() {
    return (num.tryParse(travel.value!.prix!) ?? 0) * travellers.value.length;
  }

  num getFinalAmount() {
    return getTotalAmount() - reduction.value;
  }

  void onCouponChanged(String? v) {
    reduction.value = 0;
  }
}
