import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("text.loading")),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
