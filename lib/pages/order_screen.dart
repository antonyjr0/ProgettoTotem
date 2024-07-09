import 'package:flutter/material.dart';
import 'package:progetto_totem/components/categories_bar.dart';
import 'package:progetto_totem/components/footer_bar.dart';
import 'package:progetto_totem/components/header_bar.dart';
import 'package:progetto_totem/components/product_bars.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.title});
  final String title;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String categoryId = 'C01';
  String dataFromChild = '';
  void onDataReceived(String data) {
    setState(() {
      dataFromChild = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(152, 251, 152, 0.5),
      body: Column(
        children: [
          HeaderBar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
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
                        child: CategoriesBar(
                          callback: onDataReceived,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 105, 180, 0.5),
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: ProductBars(
                          categoryId: dataFromChild.isEmpty
                              ? categoryId
                              : dataFromChild,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterBar(),
    );
  }
}
