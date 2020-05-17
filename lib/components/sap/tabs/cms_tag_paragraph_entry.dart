import 'package:flutter/material.dart';

class CMSTabParagraphEntry {
  String headline;

  Widget child;

  bool isExpanded;

  CMSTabParagraphEntry(
      {@required this.headline, @required this.child, this.isExpanded = false});

  ExpansionPanel renderTab(BuildContext context) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(headline),
        );
      },
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: child,
      ),
      isExpanded: isExpanded,
    );
  }
}
