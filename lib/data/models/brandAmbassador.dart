class BrandAmabssadorModel {
  int? id;
  String? name;

  BrandAmabssadorModel(
      {this.id,
      this.name,});

  BrandAmabssadorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  static fromMap(Map<String, String> map) {}
}
