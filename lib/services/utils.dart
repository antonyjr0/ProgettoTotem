import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:progetto_totem/models/category_item.dart';

class Utils {
  static List<CategoryItem> categories = [];

  static Future initCategories() async {
    final categoriesString =
        await rootBundle.loadString('assets/data/categorie.json');
    final objCategories = jsonDecode(categoriesString) as List<dynamic>;
    for (int i = 0; i < objCategories.length; i++) {
      categories.add(CategoryItem.fromJson(objCategories[i]));
    }
  }
}
