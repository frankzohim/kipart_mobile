import 'package:get/get.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/repo/api.dart';

class AllAgenciesController extends GetxController with StateMixin<bool> {
  final agencies = Rx<List<AgencesModel>>([]);
  
  @override
  void onInit() {
    loadAgencies(0);
    super.onInit();
  }

  loadAgencies(int page) {
    change(null, status: RxStatus.loading());
    Api().agencyRepo.getAgencies(page).then((value) {
      change(true, status: RxStatus.success());
      agencies.update((val) {
        val!.addAll(value);
      });
    }).catchError((error) {
      change(false, status: RxStatus.error());
    });
  }
}
