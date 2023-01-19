import 'package:get/get.dart';

abstract class Validators {
  static String? otp(String? otp) {
    if (otp == null || !otp.isNumericOnly || otp.length != 6) {
      return "Code incorrect";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 9) {
      return "Numéro incorrect";
    }
    return null;
  }

  static String? card(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 16) {
      return "Numéro de carte invalide";
    }
    return null;
  }

  static String? cvv(String? value) {
    if (value == null || !value.isNumericOnly || value.length != 3) {
      return "Numéro CVV invalide";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 6 || value.isAlphabetOnly) {
      return "Le mot de passe doit contenir au moins 7 caractères et un chiffre";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || !value.isEmail) return "Email invalide";
    return null;
  }

  static String? equalPasswords(String? v, String other) {
    var res = password(v);
    if (res != null) return res;
    res = password(other);
    if (res != null) return res;
    if (v != other) return "Les mots de passe ne correspondent pas";
    return null;
  }

  static String? length(String? v, {int minLength = 1, int? maxLength}) {
    if (v == null || v.length < minLength) {
      return "Au moins $minLength caractères";
    }
    if (maxLength != null && v.length > maxLength) {
      return "Au plus $maxLength caractères";
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
