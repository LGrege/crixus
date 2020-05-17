import 'package:crixus_flutter_storefront/screens/landing_screen.dart';
import 'package:crixus_flutter_storefront/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'app_config.dart';
import 'services/localization/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await AppConfig.forEnvironment("env-dev");
  GetIt.I.registerSingleton<AppConfig>(config);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crixus Cloud Commerce Storefront',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            subtitle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: LandingScreen(),
      routes: {
        LandingScreen.routeName: (ctx) => LandingScreen(),
        ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
      },
    );
  }
}
