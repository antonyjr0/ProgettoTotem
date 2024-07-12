import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/card_item.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/providers/category_provider.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';

// ignore: must_be_immutable
class ProductBars extends ConsumerStatefulWidget {
  const ProductBars({super.key});

  @override
  ConsumerState<ProductBars> createState() => _ProductBarsState();
}

class _ProductBarsState extends ConsumerState<ProductBars> {
  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);
    List<ProductItem> filteredProducts = Utils.items.where((element) {
      return element.categoryId == ref.watch(categoryProvider);
    }).toList();
    List<Widget> elementList = [];
    for (var i = 0; i < filteredProducts.length; i++) {
      var filteredProduct = filteredProducts[i];
      elementList.add(CardItem(item: filteredProduct, order: order!));
    }
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          ...elementList,
        ],
      ),
    );
  }
}
