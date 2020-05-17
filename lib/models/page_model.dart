import 'package:flutter/material.dart';

import 'content_slot_model.dart';

class PageModel with ChangeNotifier {
  final String uid;

  final String title;

  final List<ContentSlotModel> contentSlots;

  PageModel({this.uid, this.title, this.contentSlots});

  factory PageModel.fromJson(Map<String, dynamic> json) {
    var contentSlotList = json['contentSlots']['contentSlot'] as List;
    return PageModel(
        uid: json['uid'],
        title: json['title'],
        contentSlots: contentSlotList
            .map((slotJson) => ContentSlotModel.fromJSON(slotJson))
            .toList());
  }

  ContentSlotModel getContentSlotForPosition(final String position) {
    return contentSlots.firstWhere((slot) => slot.position == position);
  }
}
