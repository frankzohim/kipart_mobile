import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:ki_part/utils/storage.dart';
import 'package:ki_part/data/models/users.dart';
import 'package:ki_part/data/models/ticket.dart';

class TicketRepo {
  final Dio _dio;
  const TicketRepo(this._dio);

  Future<List<String>> buyTicket(String idSubAgency,
      String amount, String codePromo, String idPayment, String cardNumber, String CVC) async {
    final UserModel user;
    await Storage.instance.init();
    final val = Storage.instance.get("currentUser");
    user = UserModel.fromMap(val);

    var endpointUrl =
        "http://kipart.stillforce.tech/api/v1/stripe/test/payment/$idPayment/$amount/$codePromo/$idSubAgency";
    print(endpointUrl);
    print("hello world");

    var requestUrl = endpointUrl;

    var responseJson = await http.post(Uri.parse(requestUrl),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": user.accessToken!
        },
        body: jsonEncode({
          'number': cardNumber,
          'exp_month': '03',
          'exp_year': '2025',
          'cvc': CVC,
          'amount': amount,
          'description': 'Paiement ticket de voyage sur KiPART',
        }));

    var resp = jsonDecode(responseJson.body);
    List<String> tickets = [];
    tickets.add(resp['message']);
    //tickets.add(resp['ticketId'][0].toString());
    List<dynamic> ticketsId = resp['ticketId'];
    ticketsId.forEach((element) {
      tickets.add(element.toString());
    });

    return tickets;
  }

  Future<String> getTicket(String idQrCode) async {

    final UserModel user;
    await Storage.instance.init();
    final val = Storage.instance.get("currentUser");
    user = UserModel.fromMap(val);

    var endpointUrl =
        "http://kipart.stillforce.tech/api/v1/get/qrCode/$idQrCode";

    var requestUrl = endpointUrl;
    var responseJson = await http.get(Uri.parse(requestUrl),
        headers: {
          'Content-type': 'image/svg',
          'Accept': 'application/json',
          "Authorization": user.accessToken!
        },
       );

    return responseJson.body;
  }

  Future<List<TicketModel>> getTicketList() async {

    final UserModel user;
    await Storage.instance.init();
    final val = Storage.instance.get("currentUser");
    user = UserModel.fromMap(val);

    var res =
    await _dio.get("/api/v1/list/tickets");
    print(res.data['data']);
    return res.data["data"]
        .map<TicketModel>((e) => TicketModel.fromJson(e))
        .toList();
  }
}
