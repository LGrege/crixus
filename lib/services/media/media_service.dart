import 'package:crixus_flutter_storefront/models/media_model.dart';
import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:flutter/material.dart';

class MediaService {
  static MediaModel getMediaForCurrentViewPort(
      List<MediaModel> medias, BuildContext context) {
    // Todo: Implement, currently always "tablet"
    return _getMediaForFormat(medias, 'tablet');
  }

  static MediaModel getMainProductImage(ProductModel product) {
    return _getMediaForFormat(product.images, 'product');
  }

  static MediaModel _getMediaForFormat(List<MediaModel> medias, String format) {
    return medias.firstWhere((m) => m.format == format);
  }
}
