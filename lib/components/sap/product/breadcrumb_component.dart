import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Implementation of the SAP Commerce [BreadcrumbComponent]
///
/// Breadcrumbs as displayed on PDP based on provided [ProductModel].
/// Displays the categories attached to the product aswell as its name.
class BreadcrumbComponent extends StatelessWidget {
  final String uid;

  BreadcrumbComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.black12,
      child: Consumer<ProductModel>(builder: (ctx, product, _) {
        return Column(
          children: <Widget>[
            _renderBreadcrumbs(product),
            _renderHeadline(product, context),
          ],
        );
      }),
    );
  }

  Widget _renderBreadcrumbs(final ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...product.categories.map((category) => Text('/${category.name}'))
      ],
    );
  }

  Widget _renderHeadline(
      final ProductModel product, final BuildContext context) {
    return Text(
      product.name,
      style: Theme.of(context).textTheme.title,
    );
  }

  factory BreadcrumbComponent.fromJSON(final Map<String, dynamic> json) {
    return BreadcrumbComponent(uid: json['uid']);
  }
}
