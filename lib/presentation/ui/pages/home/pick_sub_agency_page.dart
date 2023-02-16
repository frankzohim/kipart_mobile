import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_sub_agency_controller.dart';
import 'package:ki_part/presentation/widgets/sub_agency_widget.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';

class PickSubAgencyPage extends GetWidget<PickSubAgencyController> {
  const PickSubAgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderWithImage(
                child: Text(
                  "Select sub agency".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

              GridView.builder(
                  itemCount: controller.subAgencies.value!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (BuildContext ctx, index) {
                    return SubAgencyWidget(
                      agency: controller.agency.value,
                      subAgency: controller.subAgencies.value[index],
                      dataSearch: controller.dataSearch.value,
                    );
                  }),

              AppDimensions.serparatorVert16,
            ],
          ),
        ),
      );
    });

  }
}
