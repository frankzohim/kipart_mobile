import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ki_part/presentation/ui/pages/settings/settings_controller.dart';
import 'package:ki_part/utils/app_routes.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              title: const Text("Notifications"),
              onTap: () {
                Get.toNamed(Approutes.NOTIFICATIONS);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              title: const Text("Notez-nous"),
              onTap: controller.noteApp,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              title: const Text("Politique de confidentialité"),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              title: const Text("Conditions d'utilisation"),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              textColor: Theme.of(context).colorScheme.primary,
              title: const Text("Se deconnecter"),
              onTap: controller.logOut,
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const ListTile(
                textColor: Colors.grey,
                title: Text("Version 1.0.0"),
                onTap: null),
            const Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
