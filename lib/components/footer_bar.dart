import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> listButton = [
      OutlinedButton(
        onPressed: () {},
        child: SizedBox(
          height: 50,
          width: 150,
          child: Row(
            children: const [Icon(Icons.language), Text('Lingua/Languages')],
          ),
        ),
      ),
      OutlinedButton(
        onPressed: () {},
        child: SizedBox(
          height: 50,
          width: 150,
          child: Row(
            children: const [
              Icon(Icons.accessibility_new),
              Text('Accesibilità')
            ],
          ),
        ),
      ),
    ];
    return Container(
      height: 100,
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [...listButton],
      )),
    );
  }
}
