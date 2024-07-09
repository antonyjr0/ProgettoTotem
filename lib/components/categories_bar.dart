import 'package:flutter/material.dart';
import 'package:progetto_totem/services/utils.dart';

class CategoriesBar extends StatefulWidget {
  CategoriesBar({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> containersList = [];
    for (var i = 0; i < Utils.categories.length; i++) {
      containersList.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(
                () {
                  selectedCategoryIndex = i;
                },
              );
              print(i);
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedCategoryIndex == i
                      ? Color.fromRGBO(255, 102, 153, 0.7)
                      : Color.fromRGBO(255, 102, 153, 0.5),
                ),
                child: Center(child: Text(Utils.categories[i].name)),
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
