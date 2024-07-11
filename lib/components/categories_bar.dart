import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/providers/category_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class CategoriesBar extends ConsumerStatefulWidget {
  const CategoriesBar({super.key});

  //final void Function(String) callback;

  @override
  ConsumerState<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends ConsumerState<CategoriesBar> {
  //int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> containersList = [];
    //watch oltre a recuperare il provider, si aggancia al listener e quindi
    // rimane in ascolto delle eventuali modifiche
    String? selectedCategoryId = ref.watch(categoryProvider);
    for (var i = 0; i < Utils.categories.length; i++) {
      var categoryItem = Utils.categories[i];
      containersList.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              ref
                  .read(categoryProvider.notifier)
                  .setCategory(Utils.categories[i].categoryId);
              //print(i);
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedCategoryId == categoryItem.categoryId
                      ? Color.fromRGBO(255, 105, 180, 1)
                      : Color.fromRGBO(255, 105, 180, 0.5),
                ),
                child: Center(child: Text(categoryItem.name)),
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      child: Column(children: [
        ...containersList,
      ]),
    );
  }
}
