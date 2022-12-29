import 'package:flutter/material.dart';
import 'package:ki_part/config/app_assets.dart';

class HeaderWithImage extends StatelessWidget {
  final Widget child;
  final String imagePath;
  const HeaderWithImage(
      {super.key, required this.child, this.imagePath = AppAssets.bus});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 230,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.center,
                  begin: Alignment.bottomCenter,
                  stops: [0.2, .8],
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              child: Padding(padding: const EdgeInsets.all(8.0), child: child),
            )
          ],
        ));
  }
}
