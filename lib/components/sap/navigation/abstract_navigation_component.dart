import 'package:crixus_flutter_storefront/components/sap/cms/cms_link_component.dart';
import 'package:crixus_flutter_storefront/models/navigation_node_entry_model.dart';
import 'package:crixus_flutter_storefront/models/navigation_node_model.dart';
import 'package:crixus_flutter_storefront/services/occ-client/impl/commerce_cms_service.dart';
import 'package:flutter/material.dart';

/// Basis for [CategoryNavigationComponent] and [FooterNavigationComponent]
///
/// This abstract CMS component serves as basis for concrete navigation
/// component implementations, providing the [navigationNode] model
/// for which the component was created.
abstract class AbstractNavigationComponent extends StatelessWidget {
  final String uid;

  final NavigationNodeModel navigationNode;

  AbstractNavigationComponent({this.uid, this.navigationNode});

  /// Render [CMSLinkComponent] by fetching data from OCC
  ///
  /// Fetches relevant component information from Commerce backend
  /// and displays them as concrete component.
  Widget renderCMSLinkNavigationEntry(NavigationNodeEntryModel entry) {
    Future<dynamic> _linkComponent =
        CommerceCMSService.fetchComponentByUid(entry.itemId);
    return FutureBuilder<dynamic>(
      future: _linkComponent,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? CMSLinkComponent.fromJSON(snapshot.data['component'][0])
            : SizedBox();
      },
    );
  }

  /// Renders a single [NavigationNodeModel]
  ///
  /// Abstract declaration of method to render individual navigation nodes.
  /// Called recursively to display children of nodes if exist.
  Widget renderNavigationNode(NavigationNodeModel node, BuildContext context);
}
