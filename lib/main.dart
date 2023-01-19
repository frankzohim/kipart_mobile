import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ki_part/config/app_styles.dart';
import 'package:ki_part/presentation/ui/pages/splash/splash_page.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/translations/messages.dart';
void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(GetMaterialApp(
    translations: Messages(),
    locale: Get.deviceLocale,
    fallbackLocale: Locale('en','US') ,
    defaultTransition: Transition.leftToRight,
    getPages: Approutes.pages,
    themeMode: ThemeMode.light,
    theme: AppStyles.ligth,
    darkTheme: AppStyles.dark,
    home: const SplashPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
