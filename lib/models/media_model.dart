import 'package:get_it/get_it.dart';

import '../app_config.dart';

class MediaModel {
  static final baseURL = GetIt.I<AppConfig>().sapCommerceHost;

  final String format;

  final String altText;

  final String url;

  MediaModel({this.format, this.altText, this.url});

  factory MediaModel.fromJson(String format, Map<String, dynamic> json) {
    return MediaModel(
        format: format, altText: json['altText'], url: baseURL + json['url']);
  }
}
