import 'package:dio/dio.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/subAgency.dart';

class AgencyRepo {
  final Dio _dio;
  const AgencyRepo(this._dio);

  Future<List<AgencesModel>> getAgencies(int page) async {
    var res = await _dio.get("/api/list/agencies/$page");
    return res.data["data"]
        .map<AgencesModel>((e) => AgencesModel.fromJson(e))
        .toList();
  }

  Future<List<AgencesModel>> getAgenciesByCity(String villeDepart, String villeArrivee) async {

    var res =
        await _dio.get("/api/listAgencyByPath/$villeDepart/$villeArrivee");
    print(res.data['data']);
    return res.data["data"]
        .map<AgencesModel>((e) => AgencesModel.fromJson(e))
        .toList();
  }

  Future<List<SubAgencyModel>> getSubAgency(String agencyId) async {
    var res =
    await _dio.get("/api/list/subAgencies/$agencyId");
    //print(res.data['subAgencies']);
    return res.data["subAgencies"]
        .map<SubAgencyModel>((e) => SubAgencyModel.fromJson(e))
        .toList();
  }
}
