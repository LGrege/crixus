import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/media/media_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Implementation of the SAP Commerce [ProductImagesComponent]
///
/// Displays the main product image retrieved via the
/// [MediaService] in a full width component.
class ProductImagesComponent extends StatelessWidget {
  final String uid;

  ProductImagesComponent({this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Consumer<ProductModel>(
          builder: (ctx, product, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      MediaService.getMainProductImage(product).url,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }

  factory ProductImagesComponent.fromJSON(final Map<String, dynamic> json) {
    return ProductImagesComponent(uid: json['uid']);
  }
}
