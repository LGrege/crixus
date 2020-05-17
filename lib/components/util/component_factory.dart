import 'package:crixus_flutter_storefront/components/sap/navigation/category_navigation_component.dart';
import 'package:crixus_flutter_storefront/components/sap/product/product_images_component.dart';
import 'package:crixus_flutter_storefront/components/sap/product/product_intro_component.dart';
import 'package:crixus_flutter_storefront/components/sap/product/product_summary_component.dart';
import 'package:crixus_flutter_storefront/components/sap/tabs/cms_tab_paragraph_container.dart';
import 'package:crixus_flutter_storefront/components/sap/product/breadcrumb_component.dart';
import 'package:crixus_flutter_storefront/components/sap/product/product_add_to_cart_component.dart';
import 'package:crixus_flutter_storefront/components/sap/tabs/components/cms_tab_paragraph_component.dart';
import 'package:crixus_flutter_storefront/components/sap/tabs/components/product_details_tab_component.dart';
import 'package:crixus_flutter_storefront/components/sap/tabs/components/product_reviews_tab_component.dart';
import 'package:crixus_flutter_storefront/components/sap/tabs/components/product_specs_tab_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app_config.dart';
import '../sap/cms/cms_flex_component.dart';
import '../sap/cms/cms_link_component.dart';
import '../sap/cms/cms_paragraph_component.dart';
import '../sap/navigation/footer_navigation_component.dart';
import '../sap/product/product_carousel_component.dart';
import '../sap/cms/simple_responsive_banner_component.dart';

/// Factory used for generating SAP Commerce components from JSON
///
/// Components retrieved via SAP Commerces OCC layer in JSON format
/// are parsed to Flutter Widgets using its typeCode.
class ComponentFactory {
  static Widget getComponentFromJSON(final Map<String, dynamic> json) {
    String typeCode = json['typeCode'];
    switch (typeCode) {
      case 'SimpleResponsiveBannerComponent':
        return SimpleResponsiveBannerComponent.fromJSON(json);
      case 'ProductCarouselComponent':
        return ProductCarouselComponent.fromJSON(json);
      case 'CMSParagraphComponent':
        return CMSParagraphComponent.fromJSON(json);
      case 'CMSLinkComponent':
        return CMSLinkComponent.fromJSON(json);
      case 'FooterNavigationComponent':
        return FooterNavigationComponent.fromJSON(json);
      case 'BreadcrumbComponent':
        return BreadcrumbComponent.fromJSON(json);
      case 'ProductIntroComponent':
        return ProductIntroComponent.fromJSON(json);
      case 'ProductImagesComponent':
        return ProductImagesComponent.fromJSON(json);
      case 'ProductSummaryComponent':
        return ProductSummaryComponent.fromJSON(json);
      case 'ProductAddToCartComponent':
        return ProductAddToCartComponent.fromJSON(json);
      case 'CMSTabParagraphContainer':
        return CMSTabParagraphContainer.fromJSON(json);
      case 'CMSTabParagraphComponent':
        return CMSTabParagraphComponent.fromJSON(json);
      case 'ProductDetailsTabComponent':
        return ProductDetailsTabComponent.fromJSON(json);
      case 'ProductReviewsTabComponent':
        return ProductReviewsTabComponent.fromJSON(json);
      case 'ProductSpecsTabComponent':
        return ProductSpecsTabComponent.fromJSON(json);
      case 'CategoryNavigationComponent':
        return CategoryNavigationComponent.fromJSON(json);
      case 'CMSFlexComponent':
        return CMSFlexComponent.fromJSON(json);
      default:
        return getMissingComponentPlaceholder(typeCode);
    }
  }

  static Widget getMissingComponentPlaceholder(String typeCode) {
    return GetIt.I<AppConfig>().debugModeEnabled
        ? Text('Unkown component: $typeCode')
        : Container();
  }
}
