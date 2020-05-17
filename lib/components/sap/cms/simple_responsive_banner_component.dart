import 'package:crixus_flutter_storefront/models/media_model.dart';
import 'package:crixus_flutter_storefront/services/media/media_service.dart';
import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [SimpleResponsiveBannerComponent]
///
/// Full width banner component, displaying an image.
/// The used image format is fetched depending on the screen size.
///
/// See [MediaService] for further insight.
class SimpleResponsiveBannerComponent extends StatelessWidget {
  final String uid;

  final String name;

  final List<MediaModel> media;

  SimpleResponsiveBannerComponent({this.uid, this.name, this.media});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FittedBox(
        child: Image.network(
          MediaService.getMediaForCurrentViewPort(media, context).url,
        ),
      ),
    );
  }

  factory SimpleResponsiveBannerComponent.fromJSON(
      final Map<String, dynamic> json) {
    List<MediaModel> allMedias = List();

    json['media'].forEach((mediaFormat, mediaJson) =>
        allMedias.add(MediaModel.fromJson(mediaFormat, mediaJson)));

    return SimpleResponsiveBannerComponent(
      uid: json['uid'],
      name: json['name'],
      media: allMedias,
    );
  }
}
