import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';
import 'package:ki_part/utils/password_reveal.dart';
import 'package:ki_part/data/models/brandAmbassador.dart';

class RegisterController extends GetxController with PasswordReveal {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final brandAmbassadors = Rx<List<BrandAmabssadorModel>>(List.empty(growable: true));
  final brandAmbassador = "Aucune".obs;

  final formKey = GlobalKey<FormState>();

  void onReady(){
    super.onReady();
  }
  void onInit() async{

    Api().userRepo.getBrandAmbassador().then((value) {
      print(value);
      brandAmbassadors.value = value;
      print(brandAmbassadors.value);
      brandAmbassadors.value.add(new BrandAmabssadorModel(id:-1, name: "Aucune"));
      print(brandAmbassadors.value);
    }).catchError((error) {
      print(error);
    });
    super.onInit();
  }
  void signUp() {
    if (!formKey.currentState!.validate()) return;

    print(brandAmbassador);
    print(brandAmbassadors.value);
    final BrandAmabssadorModel selectedBrand =
    brandAmbassadors.value.firstWhere((element) =>
    element.name == brandAmbassador.value.toString());
    print(selectedBrand.id);

    Loader.loading();

    Api()
        .userRepo
        .register(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
            brand_ambassadors_id: selectedBrand.id! == -1 ? null : selectedBrand.id)
        .then((value) {
      Loader.close();
      Get.offAndToNamed(Approutes.VERIFY_OTP, arguments: phoneController.text);
    }).catchError((error) {
      Loader.close();
      Loader.error(error.details);
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

}


