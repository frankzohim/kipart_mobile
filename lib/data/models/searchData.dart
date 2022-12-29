class SearchData {
  late String type;
  late String departure;
  late String arrival;
  late String departure_time;
  late String dateDeparture;
  late String? dateArrival;
  late String? heureArrival;
  late String number_of_places;
  late String classe;

  SearchData(
      {required this.type,
      required this.departure,
      required this.arrival,
      required this.departure_time,
      required this.dateDeparture,
      this.dateArrival,
      this.heureArrival,
      required this.number_of_places,
      required this.classe});

  SearchData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    departure = json['departure'];
    arrival = json['arrival'];
    departure_time = json['departure_time'];
    dateDeparture = json['dateDeparture'];
    dateArrival = json['dateArrival'];
    heureArrival = json['heureArrival'];
    number_of_places = json['number_of_places'];
    classe = json['classe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['departure'] = departure;
    data['arrival'] = arrival;
    data['departure_time'] = departure_time;
    data['dateDeparture'] = dateDeparture;
    data['dateArrival'] = dateArrival;
    data['heureArrival'] = heureArrival;
    data['number_of_places'] = number_of_places;
    data['classe'] = classe;
    return data;
  }
}
