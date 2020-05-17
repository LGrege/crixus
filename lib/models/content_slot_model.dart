import 'dart:convert';

class ContentSlotModel {
  final String slotId;

  final String position;

  final String name;

  final List<String> componentsJson;

  const ContentSlotModel(
      {this.slotId, this.position, this.name, this.componentsJson});

  factory ContentSlotModel.fromJSON(Map<String, dynamic> jsonObject) {
    var componentList = jsonObject['components']['component'] as List;
    return ContentSlotModel(
        slotId: jsonObject['slotId'],
        position: jsonObject['position'],
        name: jsonObject['name'],
        componentsJson: componentList
            .map((componentJson) => json.encode(componentJson))
            .toList());
  }
}