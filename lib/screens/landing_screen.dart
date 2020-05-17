import 'package:crixus_flutter_storefront/components/util/content_slot.dart';
import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:flutter/material.dart';

import 'abstract_page_state.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = 'homepage';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends AbstractPageScreenState<LandingScreen> {
  @override
  String getPageQueryParameters(Object routeArguments) {
    return 'pageLabelOrId=${LandingScreen.routeName}';
  }

  @override
  Widget buildPage(PageModel currentPage, BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ContentSlot(currentPage.getContentSlotForPosition('Section1')),
          Row(
            children: <Widget>[
              Container(
                  width: width * 0.5,
                  child: ContentSlot(
                      currentPage.getContentSlotForPosition('Section2A'))),
              Container(
                  width: width * 0.5,
                  child: ContentSlot(
                      currentPage.getContentSlotForPosition('Section2B'))),
            ],
          ),
          ContentSlot(currentPage.getContentSlotForPosition('Section3')),
          ContentSlot(currentPage.getContentSlotForPosition('Section4')),
          ContentSlot(currentPage.getContentSlotForPosition('Section5')),
          ContentSlot(currentPage.getContentSlotForPosition('Footer')),
        ],
      ),
    );
  }
}
