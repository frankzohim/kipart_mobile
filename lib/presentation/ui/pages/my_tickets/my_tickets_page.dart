import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/repo/api.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/presentation/ui/pages/my_tickets/my_tickets_controller.dart';
import 'package:ki_part/data/models/traveller.dart';

class MyTicketsPage extends GetWidget<MyTicketsController> {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes tickets") , ),
      body:
      Obx(() => ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(
          height: 8,
          thickness: 1,
        ),
        itemCount: controller.tickets.value.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {

              print(controller.tickets.value[index]);
              //Adding traveller to list
              List<Traveller> travellers = [];
              Traveller traveller = Traveller();
              traveller.name = controller.tickets.value[index].passengers[0]['nom'];
              traveller.type = controller.tickets.value[index].passengers[0]['type'];
              traveller.cni = controller.tickets.value[index].passengers[0]['cniNumber'] != null ? controller.tickets.value[index].passengers[0]['cniNumber'] : " " ;
              traveller.phone = controller.tickets.value[index].passengers[0]['telephone'].toString();
              travellers.add(traveller);

              //Converting date
              controller.tickets.value[index].travel[0]['date'] = controller.tickets.value[index].travel[0]['date'].toString().substring(0,10);

              //Creating a new travel map
              var travelMap = {
                  'id':controller.tickets.value[index].travel[0]['id'],
                  'date': controller.tickets.value[index].travel[0]['date'],
                  'departure': controller.tickets.value[index].travel[0]['departure'],
                  'arrival': controller.tickets.value[index].travel[0]['arrival'],
                  'hours': controller.tickets.value[index].travel[0]['heure'],
                  'classe': controller.tickets.value[index].travel[0]['classe'],
                  'price': controller.tickets.value[index].travel[0]['prix']
              };
              //Fetching QRCode via API for this passenger
              String qrCode = await Api().ticketRepo.getTicket(controller.tickets.value[index].id.toString());

              int amount = controller.tickets.value[index].travel[0]['prix'];

              print(controller.tickets.value[index].travel[0]);
              Get.toNamed(Approutes.TICKET,
                arguments: {
                  "amount": amount,
                  'travel': travelMap,
                  "travellers": travellers,
                  "subAgencyName": controller.tickets.value[index].agency ,
                  "qrCode" : qrCode
                },);
              //print(qrCode);
              /*showDialog(
                  context: context,
                  builder: ((context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            )),
                        MyTicketWidget(),
                      ],
                    ),
                  )));*/
            },
            child: Row(
              children: [
                Image.asset(AppAssets.logo,
                    height: 100, width: 100, fit: BoxFit.cover),
                AppDimensions.serparatorHor8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.tickets.value[index].agency!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Column(
                        children:  [
                          Text("${controller.tickets.value[index].travel[0]['date'].toString().substring(0,10)}, ${controller.tickets.value[index].travel[0]['heure']}"),
                          Text("${controller.tickets.value[index].travel[0]['departure']} -> "
                              "${controller.tickets.value[index].travel[0]['arrival']}"),
                          Text("${controller.tickets.value[index].passengers[0]['nom']}, "
                              "${controller.tickets.value[index].passengers[0]['telephone']}"),
                        ],
                      ),
                    ],
                  ),
                ),
                AppDimensions.serparatorHor8,
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ],
            ),
          );
        },
      ),
      ),

    );
  }
}
