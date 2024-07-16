import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/models/extra_item.dart';
import 'package:progetto_totem/models/order_item.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';
//import 'package:progetto_totem/providers/order_provider.dart';

class ExtrasPopup extends ConsumerStatefulWidget {
  const ExtrasPopup({super.key, required this.item});
  final ProductItem item;

  @override
  ConsumerState<ExtrasPopup> createState() => _ExtrasPopupState();
}

class _ExtrasPopupState extends ConsumerState<ExtrasPopup> {
  late OrderItem orderTemp;
  List<ExtraItem> extras = [];

  int selectedProductIndex = 0;

  @override
  void initState() {
    super.initState();
    orderTemp = ref.read(orderProvider)!.clone();

    List<ProductExtraItem> productExtras = List.of(widget.item.extras ?? []);
    productExtras.sort((a, b) {
      return (a.order ?? 0) > (b.order ?? 0) ? 1 : -1;
    });
    for (var i = 0; i < productExtras.length; i++) {
      extras.add(Utils.extras.firstWhere((e) {
        return e.extraId == productExtras[i].extraId;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    var extrasList = [];
    List<OrderRowItem> rowsPerProduct = orderTemp.rows.where((element) {
      return element.productId == widget.item.productId;
    }).toList();

    OrderRowItem selectedRow = rowsPerProduct[selectedProductIndex];

    for (var i = 0; i < extras.length; i++) {
      var extra = extras[i];
      var isChecked = selectedRow.extras!
          .any((element) => element.extraId == extra.extraId);

      extrasList.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${extra.description} - ${extra.price} €',
              style: TextStyle(fontSize: 15)),
          Switch(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
                if (value) {
                  selectedRow.extras ??= [];
                  selectedRow.extras!
                      .add(OrderExtraItem(extraId: extra.extraId, qty: 1));
                } else {
                  selectedRow.extras!.removeWhere((e) {
                    return e.extraId == extra.extraId;
                  });
                }
              });
            },
          )
        ],
      ));
    }

    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 60),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Personalizza il tuo gelato',
                    style: TextStyle(fontSize: 30))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: selectedProductIndex > 0
                      ? () {
                          setState(() {
                            selectedProductIndex--;
                          });
                        }
                      : null,
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 60,
                  ),
                ),
                // Image(image: Image.asset('${widget.item.image}')),
                Text(
                  '${widget.item.description} ${selectedProductIndex + 1}',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    if (selectedProductIndex < rowsPerProduct.length - 1) {
                      setState(() {
                        selectedProductIndex++;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 60,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                scrollDirection: Axis.vertical,
                children: [...extrasList],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Annulla')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(orderProvider.notifier).saveChanges(orderTemp);
                      Navigator.pop(context);
                    },
                    child: Text('Conferma')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
