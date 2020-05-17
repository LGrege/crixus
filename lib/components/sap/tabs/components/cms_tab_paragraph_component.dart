import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CMSTabParagraphComponent extends StatelessWidget {
  final String uid;

  final String content;

  CMSTabParagraphComponent({this.uid, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: content,
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  factory CMSTabParagraphComponent.fromJSON(final Map<String, dynamic> json) {
    return CMSTabParagraphComponent(
      uid: json['uid'],
      content: json['content'],
    );
  }
}
