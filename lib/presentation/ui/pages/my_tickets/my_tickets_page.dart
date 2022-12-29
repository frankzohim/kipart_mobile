import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_part/config/app_assets.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/presentation/ui/pages/ticket/ticket_page.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes tickets") , ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(
          height: 8,
          thickness: 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
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
                      )));
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
                        "Nom de l'agence",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Column(
                        children: const [
                          Text("Ven. 16 Dec., 04h00"),
                          Text("Douala -> Yaoundé")
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
    );
  }
}
