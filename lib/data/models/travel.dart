class TravelsModel {
  int? id;
  String? date;
  String? departure;
  String? arrival;
  String? agence;
  int? agencyId;
  String? pathId;
  String? state;
  String? classe;
  String? prix;

  TravelsModel(argument, 
      {this.id,
      this.date,
      this.departure,
      this.arrival,
      this.agence,
      this.agencyId,
      this.pathId,
      this.state,
      this.classe,
      this.prix});

  TravelsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    departure = json['departure'];
    arrival = json['arrival'];
    agence = json['agence'];
    agencyId = json['agency_id'];
    pathId = json['path_id'];
    state = json['state'];
    classe = json['classe'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['departure'] = departure;
    data['arrival'] = arrival;
    data['agence'] = agence;
    data['agency_id'] = agencyId;
    data['path_id'] = pathId;
    data['state'] = state;
    data['classe'] = classe;
    data['prix'] = prix;
    return data;
  }
}
