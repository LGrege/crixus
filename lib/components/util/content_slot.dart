import 'dart:convert';

import 'package:crixus_flutter_storefront/components/util/component_factory.dart';
import 'package:crixus_flutter_storefront/models/content_slot_model.dart';
import 'package:flutter/material.dart';

/// Container component used for displaying SAP Commerce Components
///
/// Per page multiple content slots can be defined and filled with products.
/// Per content slot widget, one [ContentSlotModel] can be maintained
/// holding json of its sub components.
///
/// The [Axis] of orientation for the content slot can be specified
/// by providing the [alignment] attribute
class ContentSlot extends StatelessWidget {
  final ContentSlotModel contentSlot;

  final Axis alignment;

  ContentSlot(this.contentSlot, {this.alignment = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    List<Widget> components = _getComponentsForSlot();
    return Container(
        child: alignment == Axis.vertical
            ? Column(
                children: <Widget>[...components],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[...components],
              ));
  }

  List<Widget> _getComponentsForSlot() {
    return contentSlot.componentsJson
        .map((comp) => ComponentFactory.getComponentFromJSON(jsonDecode(comp)))
        .toList();
  }
}
