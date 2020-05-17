import 'package:crixus_flutter_storefront/components/ui/drawer/app_drawer.dart';
import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:crixus_flutter_storefront/screens/loading_screen.dart';
import 'package:crixus_flutter_storefront/services/occ-client/impl/commerce_cms_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Abstract screen used for rendering one [PageModel]
///
/// Fetches the current [PageModel] from SAP Commerce backend
/// by using the [CommerceCMSService]
abstract class AbstractPageScreenState<T extends StatefulWidget>
    extends State<T> {
  Future<PageModel> _currentPage;

  String getPageQueryParameters(Object routeArguments);

  Widget buildPage(PageModel currentPage, BuildContext context);

  @override
  void didChangeDependencies() {
    var arguments = ModalRoute.of(context).settings.arguments;
    _currentPage = CommerceCMSService.fetchPageForQueryParams(
        getPageQueryParameters(arguments));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PageModel>(
      future: _currentPage,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? _buildLoadedPage(snapshot.data)
            : LoadingScreen();
      },
    );
  }

  Widget _buildLoadedPage(final PageModel page) {
    return ChangeNotifierProvider.value(
        value: page,
        child: Scaffold(
          drawer: AppDrawer(page.title),
          appBar: AppBar(
            title: Text(page.title),
          ),
          body: buildPage(page, context),
        ));
  }
}
