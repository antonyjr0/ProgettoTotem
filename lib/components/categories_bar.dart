import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color.fromRGBO(255, 102, 153, 0.6),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(),
                child: Center(child: Text('Coni')),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Expanded(
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(),
                child: Center(child: Text('Coppette')),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.black,
            ),
            Expanded(
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(),
                child: Center(child: Text('Vaschette')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
