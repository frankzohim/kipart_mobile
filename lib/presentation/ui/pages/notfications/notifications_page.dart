import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/notfications/notifications_controller.dart';

class NotificationsPage extends GetView<NotificationsController> {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Recevez des notifications en temps réel sur votre voyage",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      AppDimensions.serparatorVert8,
                      Text(
                          "Recevez des notifications en temps réel sur les retards et l’embarquement directement sur votre mobile."),
                    ],
                  ),
                ),
                AppDimensions.serparatorHor8,
                Image.asset(
                  AppAssets.logo,
                  width: 80,
                  // height: 100,
                )
              ],
            ),
            SwitchListTile.adaptive(
                title: Text("Notifications push"),
                value: true,
                onChanged: (v) {}),
            Divider(
              height: 1,
              thickness: .5,
            ),
            AppDimensions.serparatorVert8,
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Recevez les offres spéciales et les mises à jour du produit",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      AppDimensions.serparatorVert8,
                      Text(
                          "Recevez des notifications en temps réel sur les retards et l’embarquement directement sur votre mobile."),
                    ],
                  ),
                ),
                AppDimensions.serparatorHor8,
                Image.asset(
                  AppAssets.logo,
                  width: 80,
                  // height: 100,
                )
              ],
            ),
            SwitchListTile.adaptive(
                title: Text("Notifications push"),
                value: true,
                onChanged: (v) {})
          ],
        ),
      ),
    );
  }
}
