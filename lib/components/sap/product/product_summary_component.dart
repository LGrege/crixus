import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Implementation of the SAP Commerce [ProductSummaryComponent]
class ProductSummaryComponent extends StatelessWidget {
  final String uid;

  ProductSummaryComponent({this.uid});

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
                Text(product.price.formattedValue),
                SizedBox(height: 10),
                Text(product.summary),
              ],
            );
          },
        ));
  }

  factory ProductSummaryComponent.fromJSON(final Map<String, dynamic> json) {
    String uid = json['uid'];
    return ProductSummaryComponent(uid: uid);
  }
}
