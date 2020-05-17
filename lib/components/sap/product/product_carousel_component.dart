import 'package:carousel_slider/carousel_slider.dart';
import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/occ-client/impl/commerce_product_service.dart';
import 'package:flutter/material.dart';

import 'product_carousel_entry.dart';

/// Implementation of the SAP Commerce [ProductCarouselComponent]
///
/// Renders a carousel of [ProductCarouselEntry] for the assigned
/// product codes retrieved from JSON. Products are fetched
/// from the commerce server by using the [CommerceProductService]
class ProductCarouselComponent extends StatelessWidget {
  final String uid;

  final List<String> productCodes;

  final String title;

  ProductCarouselComponent({this.uid, this.productCodes, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          CarouselSlider.builder(
            itemCount: productCodes.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              Future<ProductModel> productModel =
                  CommerceProductService.fetchProductByCode(
                      productCodes[itemIndex]);
              return FutureBuilder<ProductModel>(
                future: productModel,
                builder: (context, snapshot) => snapshot.hasData
                    ? FittedBox(child: ProductCarouselEntry(snapshot.data))
                    : SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }

  factory ProductCarouselComponent.fromJSON(final Map<String, dynamic> json) {
    List<String> productCodes = _getProductCodesFromJSON(json);
    return ProductCarouselComponent(
      uid: json['uid'],
      productCodes: productCodes,
      title: json['title'],
    );
  }

  static List<String> _getProductCodesFromJSON(
      final Map<String, dynamic> json) {
    return json['productCodes'].toString().split(" ");
  }
}
