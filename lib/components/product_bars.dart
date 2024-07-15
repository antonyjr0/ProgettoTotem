import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/card_item.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/providers/category_provider.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/providers/page_provider.dart';
import 'package:progetto_totem/services/utils.dart';

// ignore: must_be_immutable
class ProductBars extends ConsumerStatefulWidget {
  const ProductBars({super.key});

  @override
  ConsumerState<ProductBars> createState() => _ProductBarsState();
}

class _ProductBarsState extends ConsumerState<ProductBars> {
  //prodotti per pagina
  static const int _itemsPerPage = 6;

  @override
  Widget build(BuildContext context) {
    var order = ref.watch(orderProvider);
    final currentPage = ref.watch(pageProvider);
    final pageNotifier = ref.read(pageProvider.notifier);

    //se cambia categoria viene resettata la pagina a 0
    ref.listen<String?>(categoryProvider, (previous, next) {
      if (previous != next) {
        pageNotifier.resetPage();
      }
    });
    List<ProductItem> filteredProducts = Utils.items.where((element) {
      return element.categoryId == ref.watch(categoryProvider);
    }).toList();
    //prodotti filtrati per categoria e paginati correttamente

    List<Widget> elementList = [];
    for (var i = 0; i < filteredProducts.length; i++) {
      var filteredProduct = filteredProducts[i];
      elementList.add(CardItem(item: filteredProduct, order: order!));
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ...elementList,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentPage != 0
                        ? () => pageNotifier.previousPage()
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Previous'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: (currentPage + 1) * _itemsPerPage <
                            filteredProducts.length
                        ? () => pageNotifier.nextPage(
                            filteredProducts.length, _itemsPerPage)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
