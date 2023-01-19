import 'package:get/get.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/agency_repo.dart';

class PickAgencyController extends GetxController
    with StateMixin<List<AgencesModel>> {
  final searchData = Rx<SearchData?>(null);
  final data = Get.arguments;

  @override
  void onReady() {
    searchData.value = Get.arguments;
    super.onReady();
  }

  @override
  void onInit() {
    searchData.value = Get.arguments;
    loadAgencies();
    super.onInit();
  }

  void loadAgencies() {
    change(null, status: RxStatus.loading());
    Api().agencyRepo.getAgenciesByCity(
         searchData.value!.departure, searchData.value!.arrival)
        .then((value) {
      change(value, status: RxStatus.success());
    }).catchError((error) {
      change(null, status: RxStatus.error());
    });
  }
}
