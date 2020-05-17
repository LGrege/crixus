import 'package:crixus_flutter_storefront/models/category_model.dart';
import 'package:crixus_flutter_storefront/models/classification_class_model.dart';
import 'package:crixus_flutter_storefront/models/media_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'price_model.dart';

class ProductModel with ChangeNotifier {
  final String code;

  final String name;

  final String summary;

  final String description;

  final int numberOfReviews;

  final double averageRating;

  final PriceModel price;

  final List<MediaModel> images;

  final List<CategoryModel> categories;

  final List<ClassificationClassModel> classifications;

  ProductModel(
      {this.code,
      this.name,
      this.summary,
      this.description,
      this.numberOfReviews,
      this.averageRating,
      this.price,
      this.images,
      this.categories,
      this.classifications});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imagesJson = json['images'] as List;
    var categoriesJson = json['categories'] as List;
    var classificationsJson = json['classifications'] as List;

    return ProductModel(
        code: json['code'],
        name: json['name'],
        summary: json['summary'],
        description: json['description'],
        numberOfReviews: json['numberOfReviews'],
        averageRating: json['averageRating'],
        price: PriceModel.fromJson(json['price']),
        images: imagesJson.map((imageJson) {
          var format = imageJson['format'];
          return MediaModel.fromJson(format, imageJson);
        }).toList(),
        categories:
            categoriesJson.map((json) => CategoryModel.fromJSON(json)).toList(),
        classifications: classificationsJson
            .map((json) => ClassificationClassModel.fromJSON(json))
            .toList());
  }
}
