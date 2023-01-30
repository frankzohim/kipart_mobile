import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ki_part/config/app_styles.dart';
import 'package:ki_part/presentation/ui/pages/splash/splash_page.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/translations/messages.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
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


  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("46436ad1-1964-4756-8092-fb9355bf19f5");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
  });

  OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });

  OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });


}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
