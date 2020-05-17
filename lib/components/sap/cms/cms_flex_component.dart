import 'package:crixus_flutter_storefront/components/util/component_factory.dart';
import 'package:flutter/material.dart';

/// Implementation of the SAP Commerce [CMSFlexComponent]
///
/// This CMS component contains the special flexType attribute.
/// The attribute is used to map the components typeCode instead of
/// the actual one
class CMSFlexComponent extends StatelessWidget {
  final String uid;

  final Widget child;

  CMSFlexComponent({this.uid, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }

  factory CMSFlexComponent.fromJSON(final Map<String, dynamic> json) {
    Widget child = _getChildForFlexType(json);
    return CMSFlexComponent(
      uid: json['uid'],
      child: child,
    );
  }

  static Widget _getChildForFlexType(final Map<String, dynamic> json) {
    json['typeCode'] = json['flexType'];
    return ComponentFactory.getComponentFromJSON(json);
  }
}
