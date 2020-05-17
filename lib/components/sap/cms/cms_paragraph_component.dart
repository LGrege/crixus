import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/// Implementation of the SAP Commerce [CMSParagraphComponent]
///
/// Block of text that may contain html tags within it.
/// Flutters [Html] component was used for rendering the content.
///
/// [See](https://pub.dev/packages/flutter_html)
class CMSParagraphComponent extends StatelessWidget {
  final String uid;

  final String content;

  CMSParagraphComponent({this.uid, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: content,
        customTextAlign: (_) => TextAlign.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }

  factory CMSParagraphComponent.fromJSON(final Map<String, dynamic> json) {
    return CMSParagraphComponent(uid: json['uid'], content: json['content']);
  }
}
