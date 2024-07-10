import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/pages/order_recap_screen.dart';
import 'package:progetto_totem/providers/order_provider.dart';

class HeaderBar extends ConsumerStatefulWidget {
  const HeaderBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderBarsState();
}

class _HeaderBarsState extends ConsumerState<HeaderBar> {
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
                badgeContent: Text('${ref.read(orderProvider)?.rows.length}'),
                child: Icon(Icons.shopping_cart),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Il tuo ordine: '), Text('0:00 €')],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderRecapScreen(),
                    ),
                  );
                },
                child: SizedBox(
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
