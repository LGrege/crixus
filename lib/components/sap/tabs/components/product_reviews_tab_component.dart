import 'package:flutter/material.dart';

class ProductReviewsTabComponent extends StatelessWidget {
  final String uid;

  ProductReviewsTabComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    // Todo: Implement Review Tab
    return Container(
      child: Text("Todo: Display product reviews"),
    );
  }

  factory ProductReviewsTabComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductReviewsTabComponent(
      uid: json['uid'],
    );
  }
}
