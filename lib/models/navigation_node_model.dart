import 'navigation_node_entry_model.dart';

class NavigationNodeModel {
  final String uid;

  final String title;

  final List<NavigationNodeModel> children;

  final List<NavigationNodeEntryModel> entries;

  NavigationNodeModel({this.uid, this.title, this.children, this.entries});

  factory NavigationNodeModel.fromJson(Map<String, dynamic> json) {
    var childrenJson = json['children'] as List;
    var entriesJson = json['entries'] as List;

    return NavigationNodeModel(
        uid: json['uid'],
        title: json['title'],
        children: childrenJson
            .map((json) => NavigationNodeModel.fromJson(json))
            .toList(),
        entries: entriesJson
            .map((json) => NavigationNodeEntryModel.fromJson(json))
            .toList());
  }
}
