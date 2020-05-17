import 'package:crixus_flutter_storefront/components/sap/cms/cms_link_component.dart';
import 'package:crixus_flutter_storefront/components/sap/navigation/abstract_navigation_component.dart';
import 'package:crixus_flutter_storefront/models/navigation_node_model.dart';
import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [CategoryNavigationComponent]
///
/// Category navigation used within the app drawers side navigation.
/// Makes use of the [ExpansionTile]'s to display the [navigationNode]'s
/// entries and children accordingly.
class CategoryNavigationComponent extends AbstractNavigationComponent {
  CategoryNavigationComponent({String uid, NavigationNodeModel navigationNode})
      : super(uid: uid, navigationNode: navigationNode);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            renderNavigationNode(navigationNode.children[index], context),
        itemCount: navigationNode.children.length,
      ),
    );
  }

  @override
  Widget renderNavigationNode(NavigationNodeModel node, BuildContext context) {
    if (node.children.isEmpty && node.entries.isNotEmpty) {
      return ListTile(
          title: renderCMSLinkNavigationEntry(node.entries.firstWhere(
              (entry) => CMSLinkComponent.isCMSLinkComponent(entry))));
    }
    return ExpansionTile(
      key: PageStorageKey<NavigationNodeModel>(node),
      title: Text(node.title),
      children: node.children
          .map((childNode) => renderNavigationNode(childNode, context))
          .toList(),
    );
  }

  factory CategoryNavigationComponent.fromJSON(
      final Map<String, dynamic> json) {
    NavigationNodeModel navNode =
        NavigationNodeModel.fromJson(json['navigationNode']);
    return CategoryNavigationComponent(
        uid: json['uid'], navigationNode: navNode);
  }
}
