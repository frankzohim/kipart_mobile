import 'package:flutter/material.dart';

enum CartType { coster, gp }

class CarWidget extends StatelessWidget {
  final CartType type;
  final int? place;
  const CarWidget({super.key, this.type = CartType.coster, this.place = 10});

  @override
  Widget build(BuildContext context) {
    final deco = BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.black);
    final style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    return Column(
      children: List.generate(
        type == CartType.coster ? 10 : 18,
        (i) => Container(
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              decoration: deco.copyWith(
                  color: ((i * 4) + 1) % 3 != 1 ? Colors.grey : Colors.black),
              padding: const EdgeInsets.all(16),
              width: 50,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                "${(i * 4) + 1}",
                style: style,
              ),
            ),
            Container(
              decoration: deco.copyWith(
                  color: ((i * 4) + 1) % 3 != 0 ? Colors.grey : Colors.black),
              child: Text("${(i * 4) + 2}", style: style),
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
            Container(
              width: 50,
            ),
            if (((i * 4) + 3) <= 70)
              Container(
                decoration: deco.copyWith(
                    color: ((i * 4) + 1) % 3 == 2 ? Colors.grey : Colors.black),
                child: Text("${(i * 4) + 3}", style: style),
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              ),
            // Container(
            // decoration: deco,
            // child: Text("${(i * 4) + 4}", style: style),
            // width: 50,
            // height: 50,
            // padding: const EdgeInsets.all(16),
            // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            // ),
            if (type != CartType.coster && ((i * 4) + 4) <= 70)
              Container(
                decoration: deco.copyWith(
                    color: ((i * 4) + 1) % 3 == 0 ? Colors.grey : Colors.black),
                child: Text("${(i * 4) + 4}", style: style),
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              )
          ]),
        ),
      ),
    );
  }
}
