import 'package:crixus_flutter_storefront/models/navigation_node_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Implementation of the SAP Commerce [CMSLinkComponent]
///
/// Represents the lowest level of navigation structures.
/// On tap, the used [InkWell] will open the url provided
class CMSLinkComponent extends StatelessWidget {
  final String uid;

  final String linkName;

  final String url;

  CMSLinkComponent({this.uid, this.linkName, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: new Text(linkName),
        onTap: () => launch(url),
      ),
    );
  }

  factory CMSLinkComponent.fromJSON(final Map<String, dynamic> json) {
    return CMSLinkComponent(
      uid: json['uid'],
      linkName: json['linkName'],
      url: json['url'],
    );
  }

  static bool isCMSLinkComponent(final NavigationNodeEntryModel entry) {
    return entry.itemType == CMSLinkComponent().runtimeType.toString();
  }
}
