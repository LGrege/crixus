import 'package:crixus_flutter_storefront/components/util/content_slot.dart';
import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:crixus_flutter_storefront/services/occ-client/impl/commerce_product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'abstract_page_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = 'products';

  @override
  _ProductDetailsScreen createState() => _ProductDetailsScreen();
}

class _ProductDetailsScreen
    extends AbstractPageScreenState<ProductDetailsScreen> {
  String _productCode;

  @override
  String getPageQueryParameters(Object routeArguments) {
    _productCode = routeArguments as String;
    return 'pageType=ProductPage&code=$_productCode';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget buildPage(PageModel currentPage, BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<ProductModel>(
            future: CommerceProductService.fetchProductByCode(_productCode),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? _buildPDPForProduct(snapshot.data, currentPage, context)
                  : Text(
                      AppLocalizations.of(context).translate("text.loading"));
            }));
  }

  Widget _buildPDPForProduct(final ProductModel product,
      final PageModel currentPage, final BuildContext context) {
    return ChangeNotifierProvider.value(
      value: product,
      child: Column(
        children: <Widget>[
          ContentSlot(
              currentPage.getContentSlotForPosition('BottomHeaderSlot')),
          ContentSlot(currentPage.getContentSlotForPosition('Summary')),
          ContentSlot(currentPage.getContentSlotForPosition('UpSelling')),
          ContentSlot(currentPage.getContentSlotForPosition('CrossSelling')),
          ContentSlot(currentPage.getContentSlotForPosition('Tabs')),
          ContentSlot(
              currentPage.getContentSlotForPosition('PlaceholderContentSlot')),
          ContentSlot(currentPage.getContentSlotForPosition('Footer')),
        ],
      ),
    );
  }
}
