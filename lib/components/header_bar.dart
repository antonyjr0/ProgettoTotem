import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/pages/order_recap_screen.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class HeaderBar extends ConsumerStatefulWidget {
  const HeaderBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderBarsState();
}

class _HeaderBarsState extends ConsumerState<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    int? contatoreBadge = ref.watch(orderProvider)?.rows.length;
    List<ProductItem> products = [];
    for (int i = 0; i < ref.read(orderProvider)!.rows.length; i++) {
      ProductItem product = Utils.items
          .where((item) =>
              item.productId == ref.read(orderProvider)!.rows[i].productId)
          .first;
      //print(product.description);
      products.add(product);
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              badges.Badge(
                badgeContent: Text('$contatoreBadge'),
                child: Icon(Icons.shopping_cart),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Il tuo ordine: '),
                    Text('€${Utils.getPrezzo(products)}')
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  if (contatoreBadge != 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderRecapScreen(),
                      ),
                    );
                  }
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
