import 'package:get/get.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/repo/api.dart';

class ListTicketController extends GetxController {

  final travellers = Rx<List<Traveller>>([]);
  dynamic travel;
  final subAgency  = Rx<SubAgencyModel?>(null);
  String msg = '';
  var amount = Get.arguments['amount'];
  var paymentId = Get.arguments['paymentId'];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() async{
    await loadArguments();
  }

  getTicket(int id)async{
    String qrCode = await Api().ticketRepo.getTicket("83");
    return qrCode;
  }

  loadArguments() async{
    travellers.value = await Get.arguments["travellers"];
    subAgency.value = await Get.arguments["subAgency"];
    travel = await Get.arguments["travel"];
    paymentId = (await Get.arguments["paymentId"]).toString();
  }

}
