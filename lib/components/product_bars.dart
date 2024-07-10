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
  Map<String, int> contatori = {};
  @override
  Widget build(BuildContext context) {
    List<ProductItem> filteredProducts = Utils.items.where((element) {
      return element.categoryId == ref.watch(categoryProvider);
    }).toList();
    List<Widget> elementList = [];
    for (var i = 0; i < filteredProducts.length; i++) {
      var filteredProduct = filteredProducts[i];
      elementList.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(255, 192, 203, 0.7),
                  ),
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                            child: Text(filteredProduct.description),
                          )),
                          Expanded(
                            child: Center(
                              child: Center(
                                child: Row(
                                  key: Key(filteredProduct.productId),
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Container(child: Text('-'))),
                                    Text(
                                        '${contatori[filteredProduct.productId] ?? 0}'),
                                    OutlinedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      onPressed: () {
                                        ref
                                            .read(orderProvider.notifier)
                                            .addRow(filteredProduct.productId);
                                        print(
                                            '${ref.watch(orderProvider)?.rows.length}');
                                        setState(() {
                                          contatori[filteredProduct.productId] =
                                              ref
                                                      .watch(orderProvider)
                                                      ?.rows
                                                      .where((row) =>
                                                          row.productId ==
                                                          filteredProduct
                                                              .productId)
                                                      .length ??
                                                  0;
                                        });
                                      },
                                      child: Text('+'),
                                    ),
                                  ],
                                ),
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
        ),
      );
    }
    return Container(
      child: Column(children: [
        ...elementList,
      ]),
    );
  }
}
