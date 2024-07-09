import 'package:flutter/material.dart';
import 'package:progetto_totem/components/categories_bar.dart';
import 'package:progetto_totem/components/product_bars.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(102, 255, 153, 0.5),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 102, 153, 0.5),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Container(child: Text('Contenitore Totale Ordine')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CategoriesBar(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 102, 153, 0.5),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: ProductBars(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            decoration: BoxDecoration(
              color: Color.fromRGBO(102, 255, 153, 0.7),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(child: Text('Contenitore Footer')),
          )
        ],
      ),
    );
  }
}
