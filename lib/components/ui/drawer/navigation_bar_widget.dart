import 'package:crixus_flutter_storefront/components/util/content_slot.dart';
import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageModel>(builder: (ctx, currentPage, _) {
      return Container(
        child:
            ContentSlot(currentPage.getContentSlotForPosition('NavigationBar')),
      );
    });
  }
}
