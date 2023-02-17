import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/services/user_service.dart';
import 'package:ki_part/utils/loader.dart';

class SettingsController extends GetxController {
  void noteApp() {
    showDialog(
      context: Get.context!,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: Get.back,
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              ),
              Image.asset(
                AppAssets.logo,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              AppDimensions.serparatorVert8,
              Text(
                "Tell us what you think and help us improve KiPART every day.".tr,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              AppDimensions.serparatorVert16,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: Get.back,
                  child: Text("I like!")),
              AppDimensions.serparatorVert8,
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: Get.back,
                  child: Text("Possible improvements".tr))
            ],
          ),
        ),
      ),
    );
  }

  void logOut() async {
    if (Get.find<UserService>().user.value == null) {
      Loader.error("You are not connected".tr);
      return;
    }

    var res = await showDialog<bool?>(
        context: Get.context!,
        builder: (ctx) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Confirm".tr,
                      style: Theme.of(ctx).textTheme.headline6,
                    ),
                    AppDimensions.serparatorVert8,
                     Text("Are you sure you want to log out?".tr),
                    AppDimensions.serparatorVert8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: Get.back, child:  Text("No".tr)),
                        TextButton(
                            onPressed: () => Get.back(result: true),
                            child: Text("Yes".tr))
                      ],
                    )
                  ],
                ),
              ),
            ));
    if (res != true) return;
    Loader.loading();
    Api().userRepo.logout().then((value) {
      Loader.close();
      Loader.info(message: "You have been successfully logged out".tr);
      Get.find<UserService>().logOut();
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }
}
