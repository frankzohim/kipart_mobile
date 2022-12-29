class AgencesModel {
  int? id;
  String? name;
  String? logo;
  String? headquarters;
  String? departure;
  String? arrival;
  String? email;
  String? phoneNumber;
  String? state;

  AgencesModel(
      {this.id,
      this.name,
      this.logo,
      this.headquarters,
      this.departure,
      this.arrival,
      this.email,
      this.phoneNumber,
      this.state});

  AgencesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    headquarters = json['headquarters'];
    departure = json['departure'];
    arrival = json['arrival'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['headquarters'] = headquarters;
    data['departure'] = departure;
    data['arrival'] = arrival;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['state'] = state;
    return data;
  }

  static fromMap(Map<String, String> map) {}
}
