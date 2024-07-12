import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      elementList.add(
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Card(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(255, 192, 203, 0.7),
                ),
                child: Column(children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            filteredProduct.image!,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(filteredProduct.description),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              key: Key(filteredProduct.productId),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(orderProvider.notifier)
                                          .removeRow(filteredProduct.productId);
                                      setState(() {
                                        Utils.getOrderRowsCount(
                                            order!, filteredProduct.productId);
                                      });
                                    },
                                    child: Container(child: Text('-'))),
                                Text(
                                    '${Utils.getOrderRowsCount(order!, filteredProduct.productId)}'),
                                OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(orderProvider.notifier)
                                        .addRow(filteredProduct.productId);

                                    setState(() {
                                      Utils.getOrderRowsCount(
                                          order, filteredProduct.productId);
                                    });
                                  },
                                  child: Text('+'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Personalizza'),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
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
