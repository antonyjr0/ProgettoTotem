import 'package:flutter/material.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/services/utils.dart';

class ProductBars extends StatefulWidget {
  ProductBars({super.key, required this.categoryId});
  String categoryId;

  @override
  State<ProductBars> createState() => _ProductBarsState();
}

class _ProductBarsState extends State<ProductBars> {
  @override
  Widget build(BuildContext context) {
    int contatore = 0;
    String placeholder = contatore.toString();
    List<ProductItem> filteredProducts = Utils.items.where((element) {
      return element.categoryId == widget.categoryId;
    }).toList();
    List<Widget> elementList = [];
    for (var i = 0; i < filteredProducts.length; i++) {
      elementList.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255, 102, 153, 0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Text(filteredProducts[i].description),
                  )),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        contatore -= 1;
                                      });
                                    },
                                    child: Text('-')),
                                Text(placeholder),
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        contatore += 1;
                                      });
                                    },
                                    child: Text('+')),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
