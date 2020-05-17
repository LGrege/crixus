class NavigationNodeEntryModel {
  final String itemId;

  final String itemType;

  NavigationNodeEntryModel({this.itemId, this.itemType});

  factory NavigationNodeEntryModel.fromJson(Map<String, dynamic> json) {
    return NavigationNodeEntryModel(
      itemId: json['itemId'],
      itemType: json['itemType'],
    );
  }
}
