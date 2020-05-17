import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ProductDetailsTabComponent extends StatelessWidget {
  final String uid;

  ProductDetailsTabComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(builder: (ctx, product, _) {
      return Container(
        child: Html(
          data: product.description,
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    });
  }

  factory ProductDetailsTabComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductDetailsTabComponent(
      uid: json['uid'],
    );
  }
}
