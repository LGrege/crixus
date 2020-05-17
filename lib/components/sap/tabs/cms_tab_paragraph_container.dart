import 'package:crixus_flutter_storefront/components/sap/tabs/cms_tag_paragraph_entry.dart';
import 'package:crixus_flutter_storefront/components/util/component_factory.dart';
import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:crixus_flutter_storefront/services/occ-client/impl/commerce_cms_service.dart';

import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [CMSTabParagraphContainer]
///
/// Makes use of [CMSTabParagraphEntry]'s to display all tabs assigned
/// to the PDP of that product and its content.
class CMSTabParagraphContainer extends StatefulWidget {
  final String uid;

  final List<String> componentIDs;

  final Map<String, CMSTabParagraphEntry> entries = Map();

  CMSTabParagraphContainer({this.uid, this.componentIDs});

  @override
  _CMSTabParagraphContainerState createState() =>
      _CMSTabParagraphContainerState();

  factory CMSTabParagraphContainer.fromJSON(final Map<String, dynamic> json) {
    return CMSTabParagraphContainer(
      uid: json['uid'],
      componentIDs: _getComponentIDsFromJSON(json),
    );
  }

  static List<String> _getComponentIDsFromJSON(
      final Map<String, dynamic> json) {
    return json['components'].toString().split(" ");
  }
}

class _CMSTabParagraphContainerState extends State<CMSTabParagraphContainer> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        _toggleExpandedForIndex(index, isExpanded);
      },
      children: widget.componentIDs.map((componentID) {
        widget.entries.putIfAbsent(
            componentID,
            () => CMSTabParagraphEntry(
                headline: AppLocalizations.of(context).translate("tab.$componentID.headline"),
                child: _fetchTabEntryComponent(componentID),
                isExpanded: widget.entries.isEmpty));
        return widget.entries[componentID].renderTab(context);
      }).toList(),
    );
  }

  FutureBuilder _fetchTabEntryComponent(final String componentID) {
    return FutureBuilder<dynamic>(
      future: CommerceCMSService.fetchComponentByUid(componentID),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ComponentFactory.getComponentFromJSON(
                snapshot.data['component'][0])
            : Text(AppLocalizations.of(context).translate("text.loading"));
      },
    );
  }

  void _toggleExpandedForIndex(int index, bool isExpanded) {
    setState(() {
      String componentID = widget.componentIDs[index];
      widget.entries[componentID].isExpanded = !isExpanded;
    });
  }
}
