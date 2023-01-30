import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/services/user_service.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';

class SideMenu extends StatelessWidget {
  SideMenu({super.key});
  final list = [
    NavItem(
        iconData: Icons.add_card,
        title: "Mes tickets",
        page: Approutes.MY_TICKETS,
        requireLogin: true),
    // NavItem(title: "Agence", page: const AgencyDetailsPage()),
    NavItem(
        iconData: Icons.mail,
        title: "Boîte de reception",
        page: Approutes.CHAT,
        requireLogin: true),
    NavItem(
        iconData: Icons.settings,
        title: "Paramètres",
        page: Approutes.SETTINGS,
        requireLogin: false),
    NavItem(
      iconData: Icons.person,
      title: "Service client",
      page: Approutes.CUSTOMER_SERVICE,
      requireLogin: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final userservice = Get.find<UserService>();
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Container(
                    height: 250,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppAssets.connexion))),
                    width: double.infinity,
                    child: Center(
                      child: Obx(
                        () => userservice.user.value == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Mon profil",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              AppDimensions.serparatorVert8,
                                              const Text(
                                                "Profitez des avantages du compte KiPART : réservation plus rapide, mise à jour en temps réel de votre voyage et bien plus encore",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                        child: Container(),
                                      )
                                    ],
                                  ),
                                  AppDimensions.serparatorVert8,
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8)),
                                      onPressed: () {
                                        Get.toNamed(Approutes.LOGIN);
                                      },
                                      child: const Text("S'identifier"))
                                ],
                              )
                            : Text(
                                "Hello, ${userservice.user.value!.name}",
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                      ),
                    )),
                Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, thickness: 1),
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return ListTile(
                        title: Text(item.title,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        onTap: () {
                          UserService userService = Get.find();
                          if (item.requireLogin &&
                              userService.user.value == null) {
                            Loader.info(message: "Vous n'êtes pas conncté");
                            return;
                          }
                          Get.toNamed(
                            item.page,
                          );
                        },
                        // subtitle: Text("Une description"),
                        leading: Icon(
                          item.iconData,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ],
    );
  }
}

class NavItem {
  final String page;
  final String title;
  final IconData iconData;
  final String? desc;
  final bool requireLogin;
  NavItem(
      {required this.title,
      required this.page,
      required this.iconData,
      this.desc,
      this.requireLogin = true});
}
