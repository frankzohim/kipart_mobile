class CityModel {
  int? id;
  late String ville;

    CityModel(
      {this.id,
      required this.ville});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ville = json['ville'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ville'] = ville;
    return data;
  }
}