import 'package:get/get.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_controller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/travel_repo.dart';

class SearchResultController extends GetxController
    with StateMixin<List<dynamic>> {
  final searchData = Rx<SearchData?>(null);
  // List<TravelsModel> travels = [];

  List travels = [];

  //late SearchData searchData;

  @override
  void onReady() {
    searchData.value = Get.arguments;
    print('hello in search result controller');
    print(searchData.value?.departure);
    print(searchData.value?.departure_time);
    super.onReady();
  }

  @override
  void onInit() {
    loadArguments();
    super.onInit();
  }

  loadArguments() async {
    searchData.value = await Get.arguments;
   await loadMore();
   }

  loadMore() {
    // change(null, status: RxStatus.loading());
    TravelRepo.searchTravels(searchData.value).then((value) async {
      travels = await value;
      await TravelRepo.allTravels;
      // print('valeur de la liste');
      // print(TravelRepo.allTravels);
      // print(travels);
      // change(value,
      //     status: value.isEmpty ? RxStatus.empty() : RxStatus.success());
    }).catchError((err) {
      change(null, status: RxStatus.error());
    });
  }
}
