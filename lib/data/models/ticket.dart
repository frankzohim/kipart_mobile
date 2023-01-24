class TicketModel {
  int? id;
  var user;
  String? agency;
  var travel;
  var passengers;

  TicketModel(
      {this.id,
      required this.user,
      required this.agency,
      required this.travel,
      required this.passengers,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "user": user,
      "agency": agency,
      "travel": travel,
      "passengers": passengers,
    };
  }

  TicketModel.fromJson(Map<dynamic, dynamic> json) {
        id =  json['id'];
        user =  json['user_id'];
        agency = json['Sous-agence'];
        travel=  json['Voyage'];
        passengers = json['Passager'];
    ;
  }
}
