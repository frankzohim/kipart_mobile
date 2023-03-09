import 'package:dio/dio.dart';
import 'package:ki_part/data/models/users.dart';
import 'package:ki_part/data/models/brandAmbassador.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ki_part/utils/storage.dart';

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

  Future<String> deleteAccount() async {
    final UserModel user;
    await Storage.instance.init();
    final val = Storage.instance.get("currentUser");
    user = UserModel.fromMap(val);

    var endpointUrl =
        "http://api.mykipart.com/api/v1/delete/Account";
    print(endpointUrl);

    var requestUrl = endpointUrl;

    var responseJson = await http.post(Uri.parse(requestUrl),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": user.accessToken!
        },
        body: jsonEncode({
          'description': 'Demande de suppression d\'un compte',
        }));

    var resp = jsonDecode(responseJson.body);
    print(resp);
    return resp['message'];
  }

  Future register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      int? brand_ambassadors_id}) async {
    var res = await _dio.post("/api/register", data: {
      "name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
      "brand_ambassadors_id": brand_ambassadors_id,
    });

    return res.data;
  }

  Future<List<BrandAmabssadorModel>> getBrandAmbassador() async {

    var res =
    await _dio.get("/api/list/brandAmbassadors");
    print(res.data["brand_ambassadors"]);
    return res.data["brand_ambassadors"]
        .map<BrandAmabssadorModel>((e) => BrandAmabssadorModel.fromJson(e))
        .toList();
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
