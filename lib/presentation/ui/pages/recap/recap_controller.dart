import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/data/models/travel.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/loader.dart';

class RecapController extends GetxController {
  final travellers = Rx<List<Traveller>>([]);
  final travel = Rx<TravelsModel?>(null);

  final couponController = TextEditingController();
  final couponFormKey = GlobalKey<FormState>();
  final reduction = 0.obs;

  late String paymentId;
  @override
  void onReady() {
    travellers.value = Get.arguments["travellers"];
    travel.value = Get.arguments["travel"];
    //paymentId = "${Get.arguments["paymentId"]}";
    super.onReady();
  }

  @override
  void onClose() {
    couponController.dispose();
    super.onClose();
  }

  void applyCode() {
    if (!couponFormKey.currentState!.validate()) return;
    //Loader.loading();
    /*Api()
        .travelRepo
        .applyCoupon(couponController.text, getTotalAmount())
        .then((value) {
      Loader.close();
      reduction.value = value["reduced_price"];
      Loader.info(message: "Code appliqué avec succes");
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });*/
  }

  num getTotalAmount() {
    return (num.tryParse(travel.value!.prix!) ?? 0) * travellers.value.length;
  }

  num getFinalAmount() {
    return getTotalAmount() - reduction.value;
  }

  void onCouponChanged(String? v) {
    reduction.value = 0;
  }
}
