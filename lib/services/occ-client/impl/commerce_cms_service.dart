import 'dart:convert';

import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:http/http.dart' as http;

import '../abstract_commerce_service.dart';

class CommerceCMSService extends AbstractCommerceService {
  static Future<PageModel> fetchPageForQueryParams(
      final String queryParams) async {
    final response = await http.get(AbstractCommerceService.getBaseURI() +
        '/cms/pages?fields=DEFAULT&' +
        queryParams +
        AbstractCommerceService.getSessionParameters());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return PageModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Page');
    }
  }

  static Future<dynamic> fetchComponentByUid(final String uid) async {
    final response = await http.get(AbstractCommerceService.getBaseURI() +
        '/cms/components' +
        '?fields=DEFAULT&currentPage=0&pageSize=15&' +
        'componentIds=' +
        uid +
        AbstractCommerceService.getSessionParameters());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Product');
    }
  }
}
