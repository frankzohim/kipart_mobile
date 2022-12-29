import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/presentation/ui/pages/all_agencies/all_agencies_controller.dart';
import 'package:ki_part/presentation/widgets/agency_widget.dart';
import 'package:ki_part/presentation/widgets/error_widget.dart';

class AllAgenciesPage extends GetWidget<AllAgenciesController> {
  const AllAgenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Toutes les agences"),
        ),
        body: controller.obx(
          (v) => GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.agencies.value.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return AgencyWidget(agency: controller.agencies.value[index], dataSearch: null,);
              }),
          onError: (error) =>
              MyErrorWidget(onRetry: () => controller.loadAgencies(0)),
        ));
  }
}
