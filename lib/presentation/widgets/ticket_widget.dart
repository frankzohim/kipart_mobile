import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ki_part/config/app_dimensions.dart';
import 'package:ki_part/data/models/agences.dart';
import 'package:ki_part/data/models/searchData.dart';
import 'package:ki_part/data/models/traveller.dart';
import 'package:ki_part/repo/api.dart';
import 'package:ki_part/repo/travel_repo.dart';
import 'package:ki_part/data/models/subAgency.dart';
import 'package:ki_part/utils/app_routes.dart';
import 'package:ki_part/utils/loader.dart';

class TicketWidget extends GetWidget {
  final Traveller traveller;
  final String? ticketId;

  const TicketWidget({Key? key, required this.traveller, this.ticketId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
          Text(
          "Frank Zohim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
            AppDimensions.serparatorVert8,
            Text(
              "Frank Zohim",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
