import 'dart:convert';

import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/occ-client/abstract_commerce_service.dart';
import 'package:http/http.dart' as http;

class CommerceProductService extends AbstractCommerceService {
  static Future<ProductModel> fetchProductByCode(final String code) async {
    final response = await http.get(AbstractCommerceService.getBaseURI() +
        '/products/' +
        code +
        '?fields=DEFAULT,classifications,images(FULL)' +
        AbstractCommerceService.getSessionParameters());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Product');
    }
  }
}
