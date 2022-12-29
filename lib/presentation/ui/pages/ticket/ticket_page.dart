import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_colors.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(title: Text("Votre ticket"), ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            height: 300,
            width: double.infinity,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage(AppAssets.bus), fit: BoxFit.cover)),
          ),
          MyTicketWidget()
        ]),
      ),
    );
  }
}

class MyTicketWidget extends StatelessWidget {
  const MyTicketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(top: 32),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: TicketWidget(
            width: 300,
            height: 470, color: Colors.white,
            isCornerRounded: true,
            // padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.secondary,
                    AppColors.primary,
                  ])),
                  child: Text(
                    "Détails de votre ticket",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                BusWidget(
                  color: Theme.of(context).textTheme.headline1!.color!,
                ),
                Text(
                  "Noms & prénoms",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("CNI: XXXXXXXX"), Text("8 500")],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Tel: 6XXXXXXXX"), Text("CFA")],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(16),
                  child: Text("QRCode ici"),
                ),
                Text("Faire scanner ce QR code à l’agence"),
              ],
            ),
          ),
        ),
        AppDimensions.serparatorVert16,
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.share),
          label: Text("Partager"),
        ),
      ],
    );
  }
}
