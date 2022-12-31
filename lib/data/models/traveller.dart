import 'package:ki_part/data/models/travel.dart';

class Traveller {
  late String type;
  late String name;
  late String cni;
  late String phone;
  late int seatNumber;
  TravelsModel? travel;

  Traveller({this.seatNumber = 0});

  Map toJson() {
    return {
      "name": name,
      "cni": cni,
      "type": type,
      "seatNumber": seatNumber,
      "telephone": phone,
      "Voyage": travel?.toJson()
    };
  }

  static Traveller fromJson(e) {
    return Traveller(
        seatNumber: e["seatNumber"] is String
            ? int.parse(e["seatNumber"])
            : e["seatNumber"])
      ..cni = e["cni"] ?? ""
      ..name = e["name"]
      ..phone = e["telephone"] ?? ''
      ..type = e["type"] ?? ""
      ..travel = e["Voyage"] == null
          ? null
          : TravelsModel.fromJson(
              e["Voyage"] is List ? e["Voyage"][0] : e["Voyage"]);
  }
}
