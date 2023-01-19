class SubAgencyModel {
  int? id;
  String? name;
  String? logo;
  String? headquarters;
  String? email;
  String? phoneNumber;

  SubAgencyModel(
      {this.id,
      this.name,
      this.logo,
      this.headquarters,
      this.email,
      this.phoneNumber});

  SubAgencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nom'];
    logo = json['nom'];
    headquarters = json['localisation'];
    email = json['email'];
    phoneNumber = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['headquarters'] = headquarters;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    return data;
  }

  static fromMap(Map<String, String> map) {}
}
