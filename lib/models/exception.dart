import 'package:dio/dio.dart';

class MyException extends DioError {
  static invalidResponse(DioError error) =>
      MyException(details: "Données invalides", error: error);

  static connectionTimeOut(DioError error) =>
      MyException(details: "Délai d'attente dépassé", error: error);

  static invalidData(DioError error) => MyException(
        details: "Données invalides",
        error: error,
      );

  static noInternet(DioError error) =>
      MyException(details: "Pas d'acces internet", error: error);

  static badRequest(DioError error) => MyException(
      details: "Le serveur a retourné un message incomprehensible",
      error: error);

  static invalidVersion(DioError error) => MyException(
      details: "La version de votre app est obsolète", error: error);

  static invalidToken(DioError error) =>
      MyException(details: "Votre session a expiré", error: error);

  final int? code;
  final String? details;
  MyException({
    required DioError error,
    this.code,
    this.details = '',
  }) : super(
            requestOptions: error.requestOptions,
            error: error.error,
            response: error.response,
            type: error.type);
  @override
  String toString() {
    return "!!!!!! Custom MyException thrown CODE: $code, DETAILS: $details";
  }
}
