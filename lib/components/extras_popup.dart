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
  Map<String, List<bool>> extrasCheckedMap = {};
  late OrderItem orderTemp;

  int selectedProductIndex = 0;

  @override
  void initState() {
    super.initState();
    orderTemp = ref.read(orderProvider)!.clone();

    // Inizializza la mappa per memorizzare lo stato degli switch per ogni oggetto
    for (var row in orderTemp.rows) {
      extrasCheckedMap[row.rowId] =
          List<bool>.filled(widget.item.extras!.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var extrasList = [];
    List<OrderRowItem> rowsPerProduct = orderTemp.rows.where((element) {
      return element.productId == widget.item.productId;
    }).toList();
    String rowId = orderTemp.rows[selectedProductIndex].rowId;

    // Recupera la lista degli stati degli switch per il prodotto corrente
    List<bool> extrasChecked = extrasCheckedMap[rowId]!;

    for (var i = 0; i < widget.item.extras!.length; i++) {
      ExtraItem extra = Utils.extras.where((element) {
        return element.extraId == widget.item.extras![i].extraId;
      }).first;
      extrasList.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(extra.description, style: TextStyle(fontSize: 15)),
          Switch(
            value: extrasChecked[i],
            onChanged: (value) {
              setState(() {
                extrasChecked[i] = value;
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
