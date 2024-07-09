import 'package:flutter/material.dart';
import 'package:progetto_totem/services/utils.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> containersList = [
      Expanded(
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(),
          child: Center(child: Text('Coni')),
        ),
      ),
      Expanded(
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(),
          child: Center(child: Text('Coppette')),
        ),
      ),
      Expanded(
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(),
          child: Center(child: Text('Vaschette')),
        ),
      ),
    ];
    return Card(
      elevation: 0,
      color: Color.fromRGBO(255, 102, 153, 0.6),
      child: Container(
        child: Column(
          children: Utils.ciclaWidget(containersList),
        ),
      ),
    );
  }
}
