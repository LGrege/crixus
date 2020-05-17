class ClassificationAttributeModel {
  final String code;

  final String name;

  final Object value;

  ClassificationAttributeModel({this.code, this.name, this.value});

  factory ClassificationAttributeModel.fromJSON(Map<String, dynamic> json) {
    return ClassificationAttributeModel(
        code: json['code'], name: json['name'], value: json['featureValues'][0]['value']);
  }
}
