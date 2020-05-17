import 'package:crixus_flutter_storefront/models/classification_class_model.dart';
import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSpecsTabComponent extends StatelessWidget {
  final String uid;

  ProductSpecsTabComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(builder: (ctx, product, _) {
      return Container(
        height: 200,
        child: ListView.builder(
            itemCount: product.classifications.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildClassification(product.classifications[itemIndex]);
            }),
      );
    });
  }

  Widget _buildClassification(final ClassificationClassModel classification) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(classification.name),
          Divider(),
          ...classification.features.map((feature) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Text(feature.name)),
                    Flexible(
                      child:
                          Text(feature.value, overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
                Divider(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  factory ProductSpecsTabComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductSpecsTabComponent(
      uid: json['uid'],
    );
  }
}
