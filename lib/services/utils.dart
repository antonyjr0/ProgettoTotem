import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:progetto_totem/models/category_item.dart';
import 'package:progetto_totem/models/extra_item.dart';
import 'package:progetto_totem/models/prdouct_item.dart';

class Utils {
  static List<CategoryItem> categories = [];
  static List<ProductItem> items = [];
  static List<ExtraItem> extras = [];

  static Future initCategories() async {
    final categoriesString =
        await rootBundle.loadString('assets/data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;
    for (int i = 0; i < objCategories.length; i++) {
      categories.add(CategoryItem.fromJson(objCategories[i]));
    }
  }

  static Future initItems() async {
    final itemsString =
        await rootBundle.loadString('assets/data/prodotti.json');
    final objItems = jsonDecode(itemsString) as List<dynamic>;
    for (int i = 0; i < objItems.length; i++) {
      items.add(ProductItem.fromJson(objItems[i]));
    }
  }

  static Future initExtras() async {
    final extrasString =
        await rootBundle.loadString('assets/data/varianti.json');
    final objExtras = jsonDecode(extrasString) as List<dynamic>;
    for (int i = 0; i < objExtras.length; i++) {
      extras.add(ExtraItem.fromJson(objExtras[i]));
    }
  }
}