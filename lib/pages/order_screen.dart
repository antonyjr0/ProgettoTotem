import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/categories_bar.dart';
import 'package:progetto_totem/components/footer_bar.dart';
import 'package:progetto_totem/components/header_bar.dart';
import 'package:progetto_totem/components/product_bars.dart';
import 'package:progetto_totem/providers/category_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class OrderScreen extends ConsumerWidget {
  OrderScreen({super.key, required this.title});
  final String title;
  void setDefaultCategory(WidgetRef ref) async {
    await Future.delayed(Duration(milliseconds: 300));
    String? selectedCategoryId = ref.read(categoryProvider);
    selectedCategoryId ??
        ref
            .read(categoryProvider.notifier)
            .setCategory(Utils.categories[0].categoryId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setDefaultCategory(ref);
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
                          color: Color.fromRGBO(255, 105, 180, 0.5),
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
        ],
      ),
      bottomNavigationBar: FooterBar(),
    );
  }
}
