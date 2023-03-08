import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ki_part/data/models/city.dart';
import 'package:ki_part/data/models/hours.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:http/http.dart' as http;

class TravelRepo {
  final Dio _dio;

  static List listTravels = [];
  static List allTravels = [];
  static String message = "";

  const TravelRepo(this._dio);

  Future<List<TravelsModel>> getTravels(int page) async {
    var res = await _dio.get("/api/list/travels");
    return res.data["data"]
        .map<TravelsModel>((e) => TravelsModel.fromJson(e))
        .toList();
  }

  // Future<List<TravelsModel>> searchTravels(SearchData dataS) async {
  //   // return Future.value([]);
  //   var res = await _dio.get("/api/searchFull/travel",
  //       queryParameters: dataS.toJson());
  //   return res.data["data"]
  //       .map<TravelsModel>((e) => TravelsModel.fromJson(e))
  //       .toList();
  // }

  static Future<List<dynamic>> searchTravels(SearchData? dataS) async {
    var endpointUrl = "http://api.mykipart.com/api/searchFull/travel";
    print(endpointUrl);
    Map<String, String> queryParams = {
      'type': dataS!.type,
      'departure': dataS.departure,
      'arrival': dataS.arrival,
      'departure_time': dataS.departure_time,
      'dateDeparture': dataS.dateDeparture,
      'number_of_places': dataS.number_of_places,
      'classe': dataS.classe
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '$endpointUrl?$queryString';

    var responseJson = await http.post(Uri.parse(requestUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // "Authorization": Compte.token
    });
    // print(responseJson.body);
    var resp = jsonDecode(responseJson.body);
    if (resp['data'] != null) {
      allTravels = await resp['data'];
      return resp['data'];
    } else {
      allTravels = [];
      message = resp['message'];
      return [];
    }
  }

  Future<List<CityModel>> listTown() async {
    var res = await _dio.get("/api/list/town");
    return res.data["data"]
        .map<CityModel>((e) => CityModel.fromJson(e))
        .toList();
  }

  Future<List<HoursModel>> listHours() async {
    var res = await _dio.get("/api/list/travel/schedules");
    return res.data["data"]
        .map<HoursModel>((e) => HoursModel.fromJson(e))
        .toList();
  }


  static Future<List<dynamic>> listTravelsAgency(
      int? agencyId, SearchData? dataS) async {

    var endpointUrl =
        "http://api.mykipart.com/api/search/byAgency/$agencyId";
    print(endpointUrl);
    print("in travel list");
    Map<String, String> queryParams = {
      'type': dataS!.type,
      'departure': dataS.departure,
      'arrival': dataS.arrival,
      'departure_time': dataS.departure_time,
      'dateDeparture': dataS.dateDeparture,
      'number_of_places': dataS.number_of_places,
      'classe': dataS.classe
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '$endpointUrl?$queryString';
    // print(requestUrl);

    var responseJson = await http.post(Uri.parse(requestUrl), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // "Authorization": Compte.token
    });
    print(responseJson.body);
    var resp = jsonDecode(responseJson.body);

    // print(resp['data']);
    // print(resp['data'][0]['name']);
    if (resp['data'] != null) {
      listTravels = await resp['data'];
      return resp['data'];
    } else {
      listTravels = [];
      message = resp['message'];
      return [];
    }
  }

  Future saveTravellers(String travelleId, List<Traveller> travellers, String subAgencyId) async {
    //print(subAgencyId);
    var res = await _dio.post("api/v1/add/passengers/$travelleId/$subAgencyId",
        data: {"passengers": travellers.map((e) => e.toJson()).toList()});
    return res.data;
  }

}