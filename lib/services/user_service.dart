import 'dart:io';

import 'package:get/get.dart';
import 'package:ki_part/data/models/users.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/utils/storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class UserService extends GetxService {
  final user = Rx<UserModel?>(null);
  static Future<UserService> init() async {
    await Storage.instance.init();
    final userService = UserService();
    final val = Storage.instance.get("currentUser");
    if (val == null) return userService;
    _initNotifications(userService.user.value);
    userService.user.value = UserModel.fromMap(val);
    Api().updateToken(userService.user.value!.accessToken);

    return userService;
  }

  void login(UserModel user, bool remeberMe) {
    this.user.value = user;
    Api().updateToken(user.accessToken);
    if (remeberMe) {
      Storage.instance.save("currentUser", user.toMap());
    }
  }

  void logOut() async {
    user.value = null;
    await Storage.instance.remove("currentUser");
    Api().updateToken(null);
  }

  static void _initNotifications(UserModel? user) {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("6bb6795d-d7ba-400a-b4a5-ee2b5704f416");
    if (user != null) OneSignal.shared.setExternalUserId(user.phoneNumber);
    if (Platform.isIOS) {
      OneSignal.shared.promptUserForPushNotificationPermission();
    }
    OneSignal.shared.setOnWillDisplayInAppMessageHandler(
      (message) {
        Loader.info(message: message.jsonRepresentation().toString());
      },
    );
  }
}
