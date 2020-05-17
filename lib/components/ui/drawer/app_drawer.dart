import 'package:crixus_flutter_storefront/components/ui/drawer/login_link_widget.dart';
import 'package:crixus_flutter_storefront/components/ui/drawer/navigation_bar_widget.dart';
import 'package:crixus_flutter_storefront/components/ui/drawer/site_context_widget.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String title;

  AppDrawer(this.title);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
          ),
          LoginLinkWidget(),
          NavigationBarWidget(),
          SiteContextWidget(),
        ],
      ),
    );
  }
}
