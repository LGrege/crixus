import 'package:crixus_flutter_storefront/app_config.dart';
import 'package:get_it/get_it.dart';

abstract class AbstractCommerceService {
  static final String _host = GetIt.I<AppConfig>().sapCommerceHost;

  static final String _website = GetIt.I<AppConfig>().sapCommerceWebsite;

  static final String _basePath = "/rest/v2/";

  static final String sessionParameters = '&lang=en&curr=USD';

  static String getSessionParameters() {
    // Todo: Implement, currently always "en/USD"
    return sessionParameters;
  }

  static String getBaseURI() {
    return _host + _basePath + _website;
  }
}
