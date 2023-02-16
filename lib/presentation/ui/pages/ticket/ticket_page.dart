import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_colors.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/widgets/bus_widget.dart';
import 'package:ki_part/presentation/ui/pages/ticket/ticket_controller.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:screenshot/screenshot.dart';

class TicketPage extends GetWidget<TicketController> {
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
            height: 400,
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
   MyTicketWidget({
    Key? key,
  }) : super(key: key);

  // Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return  Column(
              children: [
                Screenshot(
                  controller: screenshotController,
                  child:
                Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(top: 32),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: TicketWidget(
                    width: 450,
                    height: 700, color: Colors.white,
                    isCornerRounded: true,
                    //padding: const EdgeInsets.all(16),
                    //padding: const EdgeInsets.all(20),
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
                        Padding(
                          padding: EdgeInsets.all(15), //apply padding to all four sides
                          child:  BusWidget(
                            color: Theme.of(context).colorScheme.primary,
                            departureCity: "${Get.arguments["travel"]['departure']}",
                            arrivalDate: "${Get.arguments["travel"]['date']}",
                            destinationCity: "${Get.arguments["travel"]['arrival']}",
                            departureDate: "${Get.arguments["travel"]['date']}",
                          ),
                        ),


                        Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Détails du voyage",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                      ,
                                    ),
                                  ],
                                ),
                                AppDimensions.serparatorVert8,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("AGENCE : "),
                                    Text("${Get.arguments["subAgencyName"]}".toUpperCase()
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("CLASSE : "),
                                    Text("${Get.arguments["travel"]['classe']}".toUpperCase()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("HEURE : "),
                                    Text("${Get.arguments["travel"]['hours']}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("MONTANT : "),
                                    Text(Get.arguments['travel']['classe'] == "vip" ?
                                    "${Get.arguments["travellers"].length * 1000 + 8000 * Get.arguments["travellers"].length} FCFA"
                                        :"${Get.arguments["travellers"].length * 500 + 3000 * Get.arguments["travellers"].length} FCFA"
                                        ,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                AppDimensions.serparatorVert8,
                                Center(
                                  child:
                                  Text(
                                    "Passagers",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                    ,
                                  ),
                                ),


                                ...Get.arguments["travellers"]
                                    .map((e) => Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                                  child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text("${_getCivitiy(e.type)} ${e.name}"),
                                          Text("CNI: ${e.cni}"),
                                          Text("TEl.: ${e.phone}"),
                                        ],
                                      )),
                                ))
                                    .toList(),

                                AppDimensions.serparatorVert16,

                              ],
                            ),
                          ),
                        ),

                        AppDimensions.serparatorVert16,
                        Container(
                            child: SvgPicture.string(
                              Get.arguments["qrCode"].toString(),
                              width: 200,
                              height: 200,
                            )
                        ),
                        AppDimensions.serparatorVert16,
                        Text("Faire scanner ce code QR à l’agence"),
                        AppDimensions.serparatorVert8,
                        Text("Nous Contacter : +237 673 18 93 79",
                            style: TextStyle(
                                fontSize: 9,
                                height: 2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                                color: Colors.orange, //font color//background color
                                letterSpacing: 2, //letter spacing
                                decoration: TextDecoration.underline, //make underline
                                decorationStyle: TextDecorationStyle.dashed, //double underline
                                decorationColor: Colors.brown, //text decoration 'underline' color
                                decorationThickness: 1.5, //decoration 'underline' thickness
                                //fontStyle: FontStyle.italic
                            ),
                          ),
                      ],
                    ),
                    )
                  ),
                ),

                AppDimensions.serparatorVert16,

                Row(
                  children:[
                    Expanded(
                      child:  TextButton.icon(
                        onPressed: () {

                          // invoking capture on
                          // screenshotController
                          screenshotController
                              .capture(delay: Duration(milliseconds: 10))
                              .then((capturedImage) async {

                                // showing the captured widget
                                // through ShowCapturedWidget
                                ShowCapturedWidget(context,
                                    capturedImage!);
                                _saved(capturedImage);
                          }).catchError((onError) {
                            print(onError);
                          });
                        },
                        icon: Icon(Icons.save),
                        label: Text("Enregistrer"),
                      ),
                    ),

                    Expanded(

                      child:TextButton.icon(
                        onPressed: () {
                          Get.offAllNamed(Approutes.MY_TICKETS);
                        },
                        icon: Icon(Icons.view_list),
                        label: Text("Mes Tickets"),
                      ),
                    ),
                  ],

                ),

                AppDimensions.serparatorVert16,
                ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Approutes.HOME);
                    },
                    child: Text("Retourner à l'acceuil")
                ),
              ],
        );

  }

   // function to show captured widget
   Future<dynamic> ShowCapturedWidget(
       BuildContext context, Uint8List capturedImage) {
     return showDialog(
       useSafeArea: false,
       context: context,
       builder: (context) => Scaffold(
         appBar: AppBar(
           title: Text("Captured widget screenshot"),
         ),
         body: Center(
             child: capturedImage != null
                 ? Image.memory(capturedImage)
                 : Container()),
       ),
     );
   }

   _saved(Uint8List image) async {
     final result = await ImageGallerySaver.saveImage(image);
     print("File Saved to Gallery");
     Get.snackbar(
         "Super !",
         "Ticket enregistré dans votre galerie",
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.amber,
         margin: EdgeInsets.all(10),
         animationDuration: Duration(milliseconds: 2000),
         isDismissible: true,
         //dismissDirection: SnackDismissDirection.HORIZONTAL
         forwardAnimationCurve: Curves.bounceInOut,
         reverseAnimationCurve: Curves.bounceInOut,
         overlayBlur: 5
     );
     Get.offAllNamed(Approutes.MY_TICKETS);
   }

  _getCivitiy(String type) {
    switch (type.toLowerCase()) {
      case "femme":
        return "Mme.";
      case "homme":
        return "M.";
      default:
        return "";
    }
  }
}
