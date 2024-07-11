import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progetto_totem/components/footer_bar.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/pages/payment_screen.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class OrderRecapScreen extends ConsumerWidget {
  const OrderRecapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> elementiCentrali = [];
    List<ProductItem> products = [];
    for (int i = 0; i < ref.watch(orderProvider)!.rows.length; i++) {
      ProductItem product = Utils.items
          .where((item) =>
              item.productId == ref.watch(orderProvider)!.rows[i].productId)
          .first;
      //print(product.description);
      products.add(product);
      elementiCentrali.add(Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsetsDirectional.all(10),
                  child: Text(product.description),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Text('€ ${product.price}'),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.pencil,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 20,
                      ),
                      onPressed: () {
                        ref.read(orderProvider.notifier).removeRowFromRecap(
                            ref.read(orderProvider)?.rows[i].rowId);
                      },
                    ),
                  )),
            ],
          ),
        ),
      ));
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'lib/images/pexels-david-disponett-1118410-16560504.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 105, 180, 0.5),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.arrow_back)),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Riepilogo Ordine',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 350,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ListView(
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              children: [...elementiCentrali],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Icon(Icons.shop)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Text(
                                        'Vai al pagamento',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('€ ${Utils.getPrezzo(products)}'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 100,
        child: FooterBar(),
      ),
    );
  }
}
