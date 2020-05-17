import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/screens/product_details_screen.dart';
import 'package:crixus_flutter_storefront/services/media/media_service.dart';
import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [ProductCarouselEntry]
class ProductCarouselEntry extends StatelessWidget {
  final ProductModel _product;

  ProductCarouselEntry(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
              arguments: _product.code);
        },
        child: Column(
          children: <Widget>[
            Image.network(
              MediaService.getMainProductImage(_product).url,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _product.name,
              style: Theme.of(context).textTheme.subtitle,
            ),
            Text(
              _product.price.formattedValue,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
