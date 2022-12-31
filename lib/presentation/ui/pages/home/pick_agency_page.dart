import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_controller.dart';
import 'package:ki_part/presentation/widgets/agency_widget.dart';
import 'package:ki_part/presentation/widgets/error_widget.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/repo/travel_repo.dart';
import 'package:ki_part/utils/app_routes.dart';

class PickAgencyPage extends GetWidget<PickAgencyController> {
  const PickAgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

        // title: const Text("Choisissez une agence"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (c) => const SearchTravelPage()));
        //       },
        //       icon: const Icon(Icons.search))
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderWithImage(
              child: Text(
                "Choisissez votre agence",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            AppDimensions.serparatorVert8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            decoration: TextDecoration.underline))),
                    onPressed: () async {
                      await TravelRepo.searchTravels(
                          controller.searchData.value);
                      await Get.toNamed(Approutes.SEARCH_RESULT,
                          arguments: controller.searchData.value);
                    },
                    child: const Text(
                      "Voir tous les départs de toutes les agences",
                    )),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
            controller.obx((snapshot) {
              return GridView.builder(
                  itemCount: snapshot!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (content, index) {
                    return AgencyWidget(
                      agency: snapshot[index],
                      dataSearch: controller.searchData.value,
                    );
                  });
            },
                onError: (error) =>
                    MyErrorWidget(onRetry: controller.loadAgencies),
                onLoading: const Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
            AppDimensions.serparatorVert16,
            OutlinedButton(
                onPressed: () {
                  // print('aller à tous');
                  Get.offAndToNamed(Approutes.ALL_AGENCIES);
                },
                child: const Text("VOIR PLUS"))
          ],
        ),
      ),
    );
  }
}
