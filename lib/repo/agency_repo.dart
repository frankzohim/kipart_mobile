import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ki_part/data/models/agences.dart';

class AgencyRepo {
  final Dio _dio;
  const AgencyRepo(this._dio);

  Future<List<AgencesModel>> getAgencies(int page) async {
    var res = await _dio.get("/api/list/agencies/$page");
    return res.data["data"]
        .map<AgencesModel>((e) => AgencesModel.fromJson(e))
        .toList();
  }

  Future<List<AgencesModel>> getAgenciesByCity(
      String villeDepart, String villeArrivee) async {
    var res =
        await _dio.get("/api/list/listAgencyByPath/$villeDepart/$villeArrivee");
    return res.data["data"]
        .map<AgencesModel>((e) => AgencesModel.fromJson(e))
        .toList();
  }
}
