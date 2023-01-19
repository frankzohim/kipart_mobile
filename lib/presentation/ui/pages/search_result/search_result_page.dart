import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_colors.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_controller.dart';
import 'package:ki_part/presentation/ui/pages/search_result/search_result_controller.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/presentation/widgets/error_widget.dart';
import 'package:ki_part/presentation/widgets/travel_widget.dart';
import 'package:ki_part/repo/travel_repo.dart';

/*class SearchResultPage extends GetWidget<SearchResultController> {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                    snap: true,
                    pinned: true,
                    floating: true,
                    expandedHeight: 160,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              const Color(0XFFF8C200)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                        "${Get.arguments.departure} - ${Get.arguments.arrival}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.primary),
                            ),
                            Text(
                                "${Get.arguments.dateDeparture} - ${Get.arguments.number_of_places} place(s)",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white)),
                            BusWidget(
                              banckgroundColor:
                                  Theme.of(context).colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ))
              ],
          body:
              // controller.obx(
              //   (travels) {
              // return
              (TravelRepo.allTravels.isNotEmpty)
                  ? ListView.builder(
                      itemCount: TravelRepo.allTravels.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) =>
                          TravelWidget(travel: TravelRepo.allTravels[index], searchData: controller.searchData,
                          agency: null, subAgency: null),
                    )
                  : Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(TravelRepo.message),
                      ),
                    )
          // ;
          // },
          // onLoading: const Center(
          //   child: CircularProgressIndicator.adaptive(),
          // ),
          // onError: (error) => MyErrorWidget(onRetry: controller.loadMore),
          // onEmpty: const Center(
          //   child: Text(
          //       "Aucun resultat pour votre recherche. Veuillez modifier vos critères et réessayez"),
          // )
          // ),
          ),
    );
  }
}*/
