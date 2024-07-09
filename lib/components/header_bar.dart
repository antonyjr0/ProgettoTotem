import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              badges.Badge(
                badgeContent: Text('0'),
                child: Icon(Icons.shopping_cart),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Il tuo ordine: '), Text('0:00 €')],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(child: Text('Vai al pagamento')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
