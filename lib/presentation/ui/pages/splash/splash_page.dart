import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_colors.dart';
import 'package:ki_part/services/user_service.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/storage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    var matrix = Matrix4.translationValues(
        -MediaQuery.of(context).size.width * .5, 0, 120)
      ..scale(1.0);
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.center,
              tileMode: TileMode.clamp,
              colors: [AppColors.secondary, AppColors.primary]),
        ),
        child: FutureBuilder<Object>(
            future:
                Future.delayed(const Duration(milliseconds: 100), () => true),
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOut,
                width: double.infinity,
                height: double.infinity,
                transform: !snapshot.hasData
                    ? matrix
                    : Matrix4.translationValues(0, 0, 0),
                onEnd: () => _getOut(context),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      height: 150,
                      width: 150,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  _getOut(BuildContext context) async {
    await Get.putAsync(() => UserService.init());
    Get.offAndToNamed(Approutes.SEARCH);
    // Get.offAndToNamed(Approutes.OPERATOR_PAYMENT);
  }
}
