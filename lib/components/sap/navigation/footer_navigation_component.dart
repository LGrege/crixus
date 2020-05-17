import 'package:crixus_flutter_storefront/components/sap/cms/cms_link_component.dart';
import 'package:crixus_flutter_storefront/components/sap/navigation/abstract_navigation_component.dart';
import 'package:crixus_flutter_storefront/models/navigation_node_model.dart';
import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [FooterNavigationComponent]
///
/// Full width navigation widget used within the footer
class FooterNavigationComponent extends AbstractNavigationComponent {
  FooterNavigationComponent({String uid, NavigationNodeModel navigationNode})
      : super(uid: uid, navigationNode: navigationNode);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                ...navigationNode.children
                    .map((node) => renderNavigationNode(node, context)),
              ],
            ),
          ),
        ));
  }

  @override
  Widget renderNavigationNode(NavigationNodeModel node, BuildContext context) {
    List<Widget> footerWidgets = [];

    if (node.title != null) {
      footerWidgets.add(_renderNavigationHeadline(node, context));
    }

    footerWidgets.addAll(node.entries
        .where((entry) => CMSLinkComponent.isCMSLinkComponent(entry))
        .map((entry) => renderCMSLinkNavigationEntry(entry)));

    footerWidgets.addAll(node.children
        .map((childNode) => renderNavigationNode(childNode, context)));

    return Container(
      child: Column(
        children: <Widget>[...footerWidgets],
      ),
    );
  }

  Widget _renderNavigationHeadline(
      final NavigationNodeModel node, final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        node.title,
        style:
            Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),
      ),
    );
  }

  factory FooterNavigationComponent.fromJSON(final Map<String, dynamic> json) {
    return FooterNavigationComponent(
      uid: json['uid'],
      navigationNode: NavigationNodeModel.fromJson(json['navigationNode']),
    );
  }
}
