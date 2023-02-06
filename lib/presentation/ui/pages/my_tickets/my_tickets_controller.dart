import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/data/models/ticket.dart';


class MyTicketsController extends GetxController
    with StateMixin<List<TicketModel>>{

  final tickets = Rx<List<TicketModel>>(List.empty(growable: true));

  @override
  void onInit() {
    loadTickets();
    super.onInit();
  }

  void loadTickets() {
    change(null, status: RxStatus.loading());
    Api().ticketRepo.getTicketList()
        .then((value) {
          print(value);
          tickets.value = value;
      change(value, status: RxStatus.success());
    }).catchError((error) {
      print(error);
      change(null, status: RxStatus.error());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }
}
