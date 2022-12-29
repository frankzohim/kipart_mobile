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
                "Dites-nous ce que vous pensez et aidez-nous à améliorer KiPART au quotidien.",
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
                  child: Text("J'aime!")),
              AppDimensions.serparatorVert8,
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: Get.back,
                  child: Text("Améliorations possibles"))
            ],
          ),
        ),
      ),
    );
  }

  void logOut() async {
    if (Get.find<UserService>().user.value == null) {
      Loader.error("Vous n'êtes pas connecté");
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
                      "Confirmer",
                      style: Theme.of(ctx).textTheme.headline6,
                    ),
                    AppDimensions.serparatorVert8,
                    const Text("Voulez-vous vraiment vous déconnecter?"),
                    AppDimensions.serparatorVert8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: Get.back, child: const Text("Non")),
                        TextButton(
                            onPressed: () => Get.back(result: true),
                            child: const Text("Oui"))
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
      Loader.info(message: "Vous asvez été déconnecté avec succes");
      Get.find<UserService>().logOut();
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }
}
