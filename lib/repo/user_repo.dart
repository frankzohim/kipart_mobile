import 'package:dio/dio.dart';
import 'package:ki_part/data/models/users.dart';

class UserRepo {
  final Dio _dio;
  UserRepo(this._dio);

  Future<UserModel> login(String phone, String password) async {
    var res = await _dio.post("/api/login", data: {
      "grant_type": "password",
      "client_id": "2",
      "client_secret": "VdjAa5yZBeUjrk86mnAGFW28nWV0IoDBATpXHkke",
      "phone_number": phone,
      "password": password,
    });
    final token = "${res.data['token_type']} ${res.data['access_token']}";
    var usr = await _dio.get("/api/v1/details/user",
        options: Options(headers: {"Authorization": token}));
    return UserModel.fromMap(usr.data)..accessToken = token;
  }

  Future register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    var res = await _dio.post("/api/register", data: {
      "name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
    });

    return res.data;
  }

  Future<bool> validateOTP(String otp, String phone) async {
    var res = await _dio
        .post("/api/verify/Otp", data: {"otp": otp, "phone_number": phone});
    return res.data != null;
  }

  Future resendCode(String phone) {
    return _dio.post("/api/resend/otp/$phone");
  }

  Future requestCodePasswordForgot(String phone) {
    return _dio.post("/api/sendCode", data: {"phone_number": phone});
  }

  Future resetPassword(
      String phone, String otp, String password, String confirmPassword) {
    return _dio.post("api/password/reset", queryParameters: {
      "code": otp,
      "password": password,
      "password_confirmation": confirmPassword,
      "phone_number": phone
    });
  }

  Future logout() {
    return _dio.post("api/v1/logout");
  }
}
