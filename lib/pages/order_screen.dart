import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/categories_bar.dart';
import 'package:progetto_totem/components/footer_bar.dart';
import 'package:progetto_totem/components/header_bar.dart';
import 'package:progetto_totem/components/product_bars.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //setDefaultCategory(ref);
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
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 105, 180, 0.5),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          HeaderBar(),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: CategoriesBar(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 8, 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              255, 105, 180, 0.5),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                        ),
                                        child: ProductBars(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
