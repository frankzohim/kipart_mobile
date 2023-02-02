import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/agency/agency_controller.dart';
import 'package:ki_part/presentation/widgets/travel_widget.dart';
import 'package:ki_part/repo/travel_repo.dart';

// class AgencyDetailsPage extends GetWidget<AgencyController> {
class AgencyDetailsPage extends GetWidget<AgencyController> {
  const AgencyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: controller.agency != null
              ? Text("${controller.agency.value!.name}")
              : const Text(''),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AppAssets.bus,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppDimensions.serparatorHor8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.subAgency.value!.name}",
                        ),
                        AppDimensions.serparatorVert8,
                        RatingBarIndicator(
                          rating: 2.25,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 30.0,
                          direction: Axis.horizontal,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(controller.agency.value!.name!.toUpperCase()))
                      ],
                    )
                  ],
                ),
              ),
              AppDimensions.serparatorVert16,
              Text(
                "Les voyages",
                style: Theme.of(context).textTheme.headline6,
              ),
              AppDimensions.serparatorVert8,
              (TravelRepo.listTravels.isNotEmpty)
                  ? ListView.builder(
                      itemCount: TravelRepo
                          .listTravels.length, //controller.travels.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = TravelRepo.listTravels[index];
                        if(item['classe'] =="classique")
                          item['price'] = "3000";
                        else
                          item['price'] = "8000";
                        /*print(item['price']);
                        print(item);*/
                        // if(widget.name == theController.travelList[index].agence)   {
                        return TravelWidget(
                          travel: item, searchData: controller.dataSearch.value!,
                          agency: controller.agency.value!, subAgency: controller.subAgency.value!,
                        );
                        // } else {
                        //   return SizedBox(height:0);
                        // }
                      })
                  : Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(TravelRepo.message),
                      ),
                    )
            ],
          ),
        ),
      );
    });
  }
}
