// ignore_for_file: prefer_const_constructors

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/data/models/city.dart';
import 'package:ki_part/data/models/hours.dart';
import 'package:ki_part/presentation/ui/pages/search_travel/search_travel_controller.dart';
import 'package:ki_part/presentation/widgets/error_widget.dart';
import 'package:ki_part/presentation/widgets/header_with_image.dart';
import 'package:ki_part/presentation/widgets/side_menu.dart';
import 'package:ki_part/services/user_service.dart';

class SearchTravelPage extends GetWidget<SearchTravelController> {
  const SearchTravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserService>().user;

    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,

          centerTitle: true,
          title: Text("KiPart",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          elevation: 0,
        ),
        drawer: SideMenu(),
        body: controller.obx((results) {
          return SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: HeaderWithImage(child: Obx((() {
                  return Text.rich(
                      TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: "hello".tr + ' '),
                            TextSpan(
                              text:
                                  "${user.value == null ? 'Guest' : user.value!.name} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "Où désirez-vous voyager?",
                            )
                          ]),
                      textAlign: TextAlign.center);
                }))),
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          DropdownButtonFormField(
                              value: controller.typeTravel.value,
                              decoration: InputDecoration(
                                  labelText: "Type de voyage",
                                  prefixIcon:
                                      Icon(Icons.compare_arrows_outlined)),
                              items: ["Aller simple", "Aller et retour"]
                                  .map((e) => DropdownMenuItem(
                                      child: Text(e), value: e))
                                  .toList(),
                              onChanged: controller.typeTravel),
                          AppDimensions.serparatorVert8,
                          DropdownButtonFormField(
                              value: controller.departure.value,
                              decoration: InputDecoration(
                                  labelText: "Lieu de départ",
                                  prefixIcon:
                                  Icon(Icons.circle_outlined)),
                              items: controller.villes
                                  .map((CityModel e) => DropdownMenuItem(
                                    value: e.ville,
                                    child: Text(e.ville),
                                  ))
                                  .toList(),
                              onChanged: controller.departure),
                          AppDimensions.serparatorVert8,
                          DropdownButtonFormField(
                              value: controller.arrival.value,
                              decoration: InputDecoration(
                                  labelText: "Destination",
                                  prefixIcon:
                                  Icon(Icons.location_on)),
                              items: controller.listVillesBack
                                  .map((CityModel e) => DropdownMenuItem(
                                    value: e.ville,
                                    child: Text(e.ville),
                                  ))
                                  .toList(),
                              onChanged: controller.arrival),


                          // if (controller.typeAheadAllerController.text ==
                          //     controller.typeAheadRetourController.text)
                          //   Text(
                          //     "La ville ne départ ne peut pas être identique à celle d'arrivée",
                          //     style: TextStyle(color: Colors.red),
                          //   ),
                          AppDimensions.serparatorVert8,
                          Row(
                            children: [
                              Expanded(
                                child: DateTimePicker(
                                  initialValue: controller.dateDepart.value,
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 30)),
                                  dateLabelText: 'Date',
                                  onChanged: controller.dateDepart,
                                  validator: (val) {
                                    //print(val);
                                    // return null;

                                    if (val == '') {
                                      return 'Saisissez une date de voyage';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) => print(val),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_month),
                                      labelText: "Date du voyage"),
                                ),
                              ),
                              AppDimensions.serparatorHor8,
                              if (controller.heures.isNotEmpty)
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: controller.heureDepart.value,
                                    items: controller.heures
                                        .map((HoursModel e) => DropdownMenuItem(
                                              value: e.heure,
                                              child: Text(e.heure),
                                            ))
                                        .toList(),
                                    onChanged: controller.heureDepart,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.hourglass_bottom),
                                        labelText: "Heure départ"),
                                  ),
                                ),
                            ],
                          ),
                          AppDimensions.serparatorVert8,
                          Obx(() {
                            return controller.typeTravel.value ==
                                    'Aller et retour'
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: DateTimePicker(
                                              initialValue:
                                                  controller.dateRetour.value,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 30)),
                                              dateLabelText: 'Date',
                                              onChanged: controller.dateRetour,
                                              validator: (val) {
                                                print(val);
                                                if (val == '') {
                                                  return 'Saisissez une date de retour';
                                                }
                                                return null;
                                              },
                                              onSaved: (val) => print(val),
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                      Icons.calendar_month),
                                                  labelText: "Date de Retour"),
                                            ),
                                          ),
                                          AppDimensions.serparatorHor8,
                                          Expanded(
                                            child:
                                                DropdownButtonFormField<String>(
                                              value:
                                                  controller.heureRetour.value,
                                              items: controller.heures
                                                  .map((e) => DropdownMenuItem(
                                                        value: e.heure,
                                                        child: Text(e.heure),
                                                      ))
                                                  .toList(),
                                              onChanged: controller.heureRetour,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                      Icons.hourglass_bottom),
                                                  labelText: "Heure retour"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppDimensions.serparatorVert8,
                                    ],
                                  )
                                : Container();
                          }),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller.nbrePassagerController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: "Nombre de passagers"),
                                  validator: (text){
                                    if (text == null || text.isEmpty) {

                                      return "Merci de préciser le nombre de passager";
                                    }
                                    if (text != null && int.parse(text) > 6) {

                                      return "Le nombre de passager doit être inférieur à 6";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              AppDimensions.serparatorHor8,
                              Expanded(
                                child: DropdownButtonFormField(
                                  value: controller.classeTravel.value,
                                  items: ["classique", "VIP"]
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: controller.classeTravel,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.star),
                                      labelText: "Classe"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              }),
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              AppDimensions.serparatorVert16,
              ElevatedButton(
                  onPressed: () {
                    if (controller.departure.value == '') {
                      controller.messageErrorDepart.value =
                          'Veuillez choisir la ville de départ';
                      return;
                    }
                    if (controller.arrival.value == '') {
                      controller.messageErrorArrive.value =
                          'Veuillez saisir votre destination';
                      return;
                    }
                    if (controller.departure.value != '' &&
                        controller.arrival.value != '' && controller.departure.value == controller.arrival.value) {
                      Get.snackbar(
                          "Erreur !!",
                          "Le départ doit être différent de la destination",
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
                      return;
                    }
                    if (controller.departure.value != '' &&
                        controller.arrival.value != '' && controller.departure.value != controller.arrival.value) {
                      controller.initSearch();
                    }
                  },
                  child: Text("Rechercher"))
            ],
          ));
        },
            onError: (error) => MyErrorWidget(onRetry: controller.loadTown),
            onLoading: Center(
              child: CircularProgressIndicator.adaptive(),
            )));
  }
}
