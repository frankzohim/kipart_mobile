import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class TicketRepo {
  final Dio _dio;
  const TicketRepo(this._dio);

  Future<String> buyTicket(
      String amount, String codePromo, String idPaiement) async {
    var endpointUrl =
        "http://kipart.stillforce.tech/api/v1/stripe/test/payment/$idPaiement/$amount/$codePromo";
    print(endpointUrl);
    // String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = endpointUrl;
    // print('les données envoyées');
    // print(requestUrl);
    var responseJson = await http.post(Uri.parse(requestUrl),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization":
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNDNkYmUyNmVlNDIzZTgxNjFhYjhlZGZiNDMwOTBkNTllZDZhOGIwNTRlYzNmYTlhODE1ZDdjZjg3NDAzMzIxMDJkMmYyNTViYjZhMGM0MzUiLCJpYXQiOjE2NzE2MTQxMTEuMzA5MDY5LCJuYmYiOjE2NzE2MTQxMTEuMzA5MDc1LCJleHAiOjE3MDMxNTAxMTAuOTkwNTAxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bDv84ryKQ9wTHhoZCm9xFffss8Axm1JX66kSLcPko7ubWqA5OX6dO3sqK1qXmEG0HTBdn7B-TNGN-T3eWQU89w5b6V_uHuv5-Z88oi8xBnFHqrnpNmhL3J7Igy-pyKQM4wkEHXIzc1_tCY2EaZbLvEXn6r9yeYweLgfxkfPV0YQOlY18RMFTvrqjD4PTzjvKqhNcuA-53Yeya97JLPBNYpGxL5uSBfvgtnZClkWRDzTGST95C5wMSpqHhHRr5cqX_oQb6L8m-zjn9_2YxGes9sPAsc0zt0ED5Jvm44stHAhkQN1Lo6SI0wHfvkrWyQJG03LrtWIbVC_HRZtQ39_O_94sPZX9eIRv2CqGeROFdjKeueP_dMf8pRsMqtGymrzkbPOdkF7d4LzNi5IPrH5pkKUICwGzsCi1X_UcmK5-BzGyLR4oAKu17eiGie3uNLo9bEI4eFaM9DHXaNXlTAW1yka4qTlX5_-a-eDukQAPUSleFT00dnGW-kCXVTFjbOFvMUSu0uBhXOI_wnZJi1CfkV-hyVJ0AXZebP7-I5rkGOEqFeKC7YGSTK-IeV1s-CwWaiCG3K2NguP386QdFNOMN22bH2GtJk-Z1Py3CRsUM3V8-PJP6XM9ToljxMSspGvQ72HVQ-CwogTo05OMDR_tQTAOj8N4zcKyd53dLvFWR4w'
        },
        body: jsonEncode({
          'number': '4242424242424242',
          'exp_month': '03',
          'exp_year': '2025',
          'cvc': '345',
          'amount': '1000',
          'description': 'First APi Integration',
        }));
    print(responseJson.body);
    var resp = jsonDecode(responseJson.body);
    return resp['message'];
  }
}
