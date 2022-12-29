import 'package:get/get.dart';

mixin PasswordReveal on GetxController {
  final isVisble = false.obs;

  change() {
    isVisble.toggle();
  }
}
