import 'package:flutter/material.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:get/get.dart';

class MyErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const MyErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 35),
          AppDimensions.serparatorVert16,
          Text(
            "An error has occurred".tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          AppDimensions.serparatorVert16,
          ElevatedButton(onPressed: onRetry, child: const Text("Try again"))
        ],
      ),
    );
  }
}
