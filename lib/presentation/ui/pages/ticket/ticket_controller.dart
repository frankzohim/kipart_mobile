import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/users.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TicketController extends GetxController {
  final travellers = Rx<List<Traveller>>([]);
  final dataSearch = Rx<SearchData?>(null);
  final agency = Rx<AgencesModel?>(null);
  final subAgency  = Rx<SubAgencyModel?>(null);
  final user  = Rx<UserModel?>(null);

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
    print(subAgency.value!.name);

  }

  @override
  void onClose() {
    super.onClose();
  }
}
