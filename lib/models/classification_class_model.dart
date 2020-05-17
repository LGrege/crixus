import 'package:crixus_flutter_storefront/models/classification_attribute_model.dart';

class ClassificationClassModel {
  final String code;

  final String name;

  final List<ClassificationAttributeModel> features;

  ClassificationClassModel({this.code, this.name, this.features});

  factory ClassificationClassModel.fromJSON(Map<String, dynamic> json) {
    var featuresJson = json['features'] as List;
    return ClassificationClassModel(
      code: json['code'],
      name: json['name'],
      features: featuresJson.map((featureJson) {
        return ClassificationAttributeModel.fromJSON(featureJson);
      }).toList(),
    );
  }
}
