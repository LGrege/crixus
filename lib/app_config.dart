import 'dart:convert';

import 'package:flutter/services.dart';

///
/// Global configuration retreived from env json files.
///
/// [Source taken from](https://flutterigniter.com/env-specific-configuration/)
///
class AppConfig {
  final String sapCommerceHost;

  final String sapCommerceWebsite;

  final bool debugModeEnabled;

  AppConfig({this.sapCommerceHost, this.sapCommerceWebsite, this.debugModeEnabled});

  static Future<AppConfig> forEnvironment(String env) async {
    // set default to dev if nothing was passed
    env = env ?? 'dev';

    // load the json file
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(sapCommerceHost: json['sapCommerceHost'],
        sapCommerceWebsite: json['sapCommerceWebsite'],
        debugModeEnabled: json['debugModeEnabled']);
  }
}
