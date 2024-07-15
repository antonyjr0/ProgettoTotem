import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/components/extras_popup.dart';
import 'package:progetto_totem/models/order_item.dart';
import 'package:progetto_totem/models/prdouct_item.dart';
import 'package:progetto_totem/providers/order_provider.dart';
import 'package:progetto_totem/services/utils.dart';

class CardItem extends ConsumerStatefulWidget {
  const CardItem({super.key, required this.item, required this.order});

  final ProductItem item;
  final OrderItem order;

  @override
  ConsumerState<CardItem> createState() => _CardItemState();
}

class _CardItemState extends ConsumerState<CardItem> {
  @override
  Widget build(BuildContext context) {
    var orderRowsCount =
        Utils.getOrderRowsCount(widget.order, widget.item.productId);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.all(8),
          color: Colors.white.withOpacity(0.5),
          shadowColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        widget.item.image!,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(widget.item.description),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          key: Key(widget.item.productId),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                                onPressed: orderRowsCount > 0
                                    ? () {
                                        ref
                                            .read(orderProvider.notifier)
                                            .removeRow(widget.item.productId);
                                        setState(() {
                                          Utils.getOrderRowsCount(widget.order,
                                              widget.item.productId);
                                        });
                                      }
                                    : null,
                                child: Container(child: Text('-'))),
                            Text(
                                '${Utils.getOrderRowsCount(widget.order, widget.item.productId)}'),
                            OutlinedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                ref
                                    .read(orderProvider.notifier)
                                    .addRow(widget.item.productId);

                                setState(() {
                                  Utils.getOrderRowsCount(
                                      widget.order, widget.item.productId);
                                });
                              },
                              child: Text('+'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: TextButton(
                    onPressed: orderRowsCount > 0
                        ? () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return ExtrasPopup(
                                    item: widget.item,
                                  );
                                });
                          }
                        : null,
                    child: Text('Personalizza'),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
