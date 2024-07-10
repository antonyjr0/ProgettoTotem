import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/carosello_immagini.dart';
import 'package:progetto_totem/components/footer_bar.dart';
import 'package:progetto_totem/pages/order_screen.dart';
import 'package:progetto_totem/providers/category_provider.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class Splashscreen extends ConsumerWidget {
  const Splashscreen({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(categoryProvider.notifier)
            .setCategory(Utils.categories[0].categoryId);
        ref.read(orderProvider.notifier).init();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderScreen(
              title: 'Order Screen',
            ),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  child: CaroselloImmagini(),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 105, 180, 0.5),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text(
                  "Tocca qui per iniziare!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: FooterBar(),
      ),
    );
  }
}
