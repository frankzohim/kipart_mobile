import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/data/models/subAgency.dart';

class OMPaymentController extends GetxController with StateMixin<String> {

  final phoneController = TextEditingController();
  final travellers = Rx<List<Traveller>>([]);
  dynamic travel;
  final subAgency  = Rx<SubAgencyModel?>(null);
  final formKey = GlobalKey<FormState>();
  final dateExp = "".obs;
  String msg = '';
  var amount = Get.arguments['amount'];
  var paymentId = Get.arguments['paymentId'];

  @override
  void onInit() async{
    await loadArguments();
  }

  loadArguments() async{
    travellers.value = await Get.arguments["travellers"];
    subAgency.value = await Get.arguments["subAgency"];
    travel = await Get.arguments["travel"];
    paymentId = (await Get.arguments["paymentId"]).toString();
    print(paymentId);
  }

  payTicket(context) async{
    //Loader.loading();
    print('hello');
    Loader.loading();
    List<String> tickets = await Api().ticketRepo.buyTicketWithOM(subAgency.value!.id.toString(), amount.toString(), 'YRTRKiP3', paymentId, "694297339");
    Loader.close();
    print(tickets);
    //List<String> tickets = await Api().ticketRepo.buyTicket(subAgency.value!.id.toString(), amount.toString(), 'YRTRKiP3', paymentId, numCard.text,cvvCard.text );
    //Loader.close();
  }
}
