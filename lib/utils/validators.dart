import 'package:get/get.dart';

abstract class Validators {
  static String? otp(String? otp) {
    if (otp == null || !otp.isNumericOnly || otp.length != 6) {
      return "Wrong code".tr;
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 9) {
      return "Wrong number".tr;
    }
    return null;
  }

  static String? card(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 16) {
      return "Invalid card number".tr;
    }
    return null;
  }

  static String? cvv(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 3) {
      return "Invalid CVC number".tr;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 5) {
      return "Password must contain at least 6 characters".tr;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || !value.isEmail) return "Invalid Email".tr;
    return null;
  }

  static String? equalPasswords(String? v, String other) {
    var res = password(v);
    if (res != null) return res;
    res = password(other);
    if (res != null) return res;
    if (v != other) return "Passwords do not match".tr;
    return null;
  }

  static String? length(String? v, {int minLength = 1, int? maxLength}) {
    if (v == null || v.length < minLength) {
      return "At least".tr + " "+ minLength.toString() + " " + "characters".tr;
    }
    if (maxLength != null && v.length > maxLength) {
      return "At most" + maxLength.toString() + "characters".tr;
    }
    return null;
  }

  static String? combine(
      String? v, List<String? Function(String? vam)> validators) {
    for (var element in validators) {
      if (element.call(v) != null) return element.call(v);
    }
    return null;
  }
}
