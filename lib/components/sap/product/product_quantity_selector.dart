import 'package:crixus_flutter_storefront/models/product_model.dart';
import 'package:crixus_flutter_storefront/services/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget used for selecting quantities on PDP
class ProductQuantitySelector extends StatelessWidget {
  final ProductModel product;

  ProductQuantitySelector({this.product});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          width: width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  decoration: new BoxDecoration(
                      border: Border.all(),
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                  flex: 8,
                  child: Container(
                      decoration: new BoxDecoration(
                          border: Border(
                        top: BorderSide(),
                        bottom: BorderSide(),
                      )),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration.collapsed(
                            hintText: '1',
                          ),
                        ),
                      ))),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: new BoxDecoration(
                      border: Border.all(),
                      borderRadius: new BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4))),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width * 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              AppLocalizations.of(context)
                  .translate("stocklevel.status.instock"),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ));
  }
}
