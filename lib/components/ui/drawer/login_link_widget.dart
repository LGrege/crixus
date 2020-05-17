import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginLinkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(
              AppLocalizations.of(context).translate('login.register.title')),
          onTap: () {}),
    );
  }
}
