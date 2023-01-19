import 'package:get/get.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/agency_repo.dart';

class PickSubAgencyController extends GetxController {
  final agency = Rx<AgencesModel?>(null);
  final dataSearch = Rx<SearchData?>(null);
  final subAgencies = Rx<List<SubAgencyModel>>([]);
  //List<SubAgencyModel>? subAgencies = [];

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onInit() {
    print('toto');
    loadArguments();
    super.onInit();
  }

  loadArguments() async {
    agency.value = await Get.arguments[0]['agency'];
    dataSearch.value = await Get.arguments[1]['dataSearch'];
    subAgencies.value = await Get.arguments[2]['subAgencies'];

    print(agency.value!.logo);
    print(dataSearch.value!.departure);
    print(subAgencies.value!.length);
  }
}
