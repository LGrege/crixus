import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_review_widget.dart';

/// Implementation of the SAP Commerce [ProductIntroComponent]
class ProductIntroComponent extends StatelessWidget {
  final String uid;

  ProductIntroComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Consumer<ProductModel>(
          builder: (ctx, product, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProductReviewWidget(product),
                SizedBox(height: 10),
                Text("ID ${product.code}"),
              ],
            );
          },
        ));
  }

  factory ProductIntroComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductIntroComponent(uid: json['uid']);
  }
}
