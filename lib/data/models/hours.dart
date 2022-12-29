class HoursModel {
  late int id;
  late String heure;

  HoursModel({required this.id, required this.heure});

  HoursModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heure = json['heure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['heure'] = heure;
    return data;
  }
}
