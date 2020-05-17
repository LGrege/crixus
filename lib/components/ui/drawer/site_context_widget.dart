import 'package:crixus_flutter_storefront/components/util/content_slot.dart';
import 'package:crixus_flutter_storefront/models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SiteContextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DropdownButton<String>(
                items: <String>['日本語', 'English', 'Deutsch', '中文']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: 'English',
                onChanged: (_) {},
              ),
              DropdownButton<String>(
                items: <String>['¥ JPY', '\$ USD'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: '\$ USD',
                onChanged: (_) {},
              )
            ],
          ),
          Consumer<PageModel>(builder: (ctx, currentPage, _) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ContentSlot(
                currentPage.getContentSlotForPosition('SiteLinks'),
                alignment: Axis.horizontal,
              ),
            );
          })
        ],
      ),
    );
  }
}
