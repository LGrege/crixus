import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';

/// Review widget used in the [ProductIntroComponent]
class ProductReviewWidget extends StatelessWidget {
  static const int MAX_RATING = 5;

  final ProductModel _product;

  ProductReviewWidget(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...List.generate(
                MAX_RATING,
                (index) {
                  return Icon(
                    index < _product.averageRating
                        ? Icons.star
                        : Icons.star_border,
                  );
                },
              ),
              Text('(${_product.numberOfReviews})'),
            ],
          ),
          InkWell(
            child: new Text(
                AppLocalizations.of(context).translate("text.show.reviews")),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
