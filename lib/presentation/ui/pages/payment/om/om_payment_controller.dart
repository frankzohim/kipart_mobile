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

    if(tickets.length != 0){
    if (tickets[0] == "successful") {
      await Alert(
          context: context,
          type: AlertType.success,
          title: "Congratulations !".tr,
          desc: "Payment made successfully".tr,
          buttons: [
            DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  CoolAlert.show(
                      context: Get.context!,
                      animType: CoolAlertAnimType.slideInLeft,
                      backgroundColor: Theme.of(Get.context!).colorScheme.secondary,
                      barrierDismissible: false,
                      loopAnimation: true,
                      text: "Please wait".tr,
                      title: "Loading...",
                      type: CoolAlertType.loading);
                  String qrCode = await Api().ticketRepo.getTicket(tickets[1]);
                  Loader.close();
                  Get.offAllNamed(Approutes.MY_TICKETS);
                  color: Colors.orange;
                  width: 120;
                }
            )]
      ).show();
    } else {
      await Alert(
        context: context,
        type: AlertType.error,
        title: "Error !!".tr+" "+tickets[0],
        desc: msg,
        buttons: [
          DialogButton(
            child: Text(
              'Close'.tr,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).pop(),
            width: 120,
          )
        ],
      ).show();
    }
    }
    else {
      await Alert(
        context: context,
        type: AlertType.error,
        title: "An error occured !!",
        desc: msg,
        buttons: [
          DialogButton(
            child: Text(
              'Close'.tr,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).pop(),
            width: 120,
          )
        ],
      ).show();
    }
  }
}
