import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/home/pick_agency_controller.dart';
import 'package:ki_part/presentation/widgets/agency_widget.dart';
import 'package:ki_part/presentation/widgets/error_widget.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/presentation/widgets/side_menu.dart';

class PickAgencyPage extends GetWidget<PickAgencyController> {
  const PickAgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderWithImage(
              child: Text(
                "Select agency".tr,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
          ],
        ),
      ),
    );
  }
}
