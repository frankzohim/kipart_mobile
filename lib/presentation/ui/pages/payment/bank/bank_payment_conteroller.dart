import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:ki_part/presentation/ui/pages/search_travel/search_travel_page.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/ticket_repo.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BankPaymentController extends GetxController with StateMixin<String> {
  CardFieldInputDetails? card;

  final dateExp = "".obs;
  final TextEditingController nomCard = TextEditingController();
  final TextEditingController numCard = TextEditingController();
  final TextEditingController cvvCard = TextEditingController();
  String msg = '';

  payTicket(context) async {
    String msg = Api().ticketRepo.buyTicket('2500', 'YRTRKiP3', '1').toString();
    print(msg);
    if (msg != "succeeded") {
      await Alert(
        context: context,
        type: AlertType.success,
        title: "Félicitation !",
        desc: "Paiement effectué avec succès.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () =>  Get.offAndToNamed(Approutes.SEARCH),
            color: Colors.orange,
            width: 120,
          )
        ],
      ).show();
    } else {
      await Alert(
        context: context,
        type: AlertType.error,
        title: "Error !",
        desc: msg,
        buttons: [
          DialogButton(
            child: Text(
              'fermer'.tr,
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
