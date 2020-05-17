import 'package:crixus_flutter_storefront/components/sap/product/product_quantity_selector.dart';
import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Implementation of the SAP Commerce [ProductAddToCartComponent]
///
/// Add to cart button and [ProductQuantitySelector] for a [ProductModel].
class ProductAddToCartComponent extends StatelessWidget {
  final String uid;

  ProductAddToCartComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(builder: (ctx, product, _) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: <Widget>[
            ProductQuantitySelector(
              product: product,
            ),
            SizedBox(
              height: 10,
            ),
            _renderAddToCartButton(context),
          ],
        ),
      );
    });
  }

  Widget _renderAddToCartButton(final BuildContext context) {
    return Container(
      width: double.infinity,
      child: FlatButton(
        child: Text(
          AppLocalizations.of(context).translate('button.add.to.cart'),
          style: TextStyle(color: Colors.white),
        ),
        color: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }

  factory ProductAddToCartComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductAddToCartComponent(
      uid: json['uid'],
    );
  }
}
