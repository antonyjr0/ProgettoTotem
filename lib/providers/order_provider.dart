import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/models/order_item.dart';
import 'package:progetto_totem/services/utils.dart';

class OrderProvider extends StateNotifier<OrderItem?> {
  OrderProvider() : super(null);

  void init() {
    state = OrderItem(rows: []);
  }

  void addRow(String productId) {
    // state?.rows.add(
    //   OrderRowItem(
    //       rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []),
    // );
    var clone = state?.clone() ?? OrderItem(rows: []);
    clone.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
    state = clone;
  }

  void removeRow(String productId) {
    var clone = state!.clone();
    var list = clone.rows.where((row) => row.productId == productId);
    if (list.isNotEmpty) {
      clone.rows.remove(list.last);
    }
    state = clone;
  }

  void removeRowFromRecap(String? rowId) {
    var clone = state!.clone();
    if (rowId != null && rowId.isNotEmpty) {
      var orderRow = clone.rows.firstWhere((row) => row.rowId == rowId);
      clone.rows.remove(orderRow);
    }
    state = clone;
  }

  void saveChanges(OrderItem orderTemp) {
    OrderItem orderTemp2;
    orderTemp2 = orderTemp.clone();
    state = orderTemp2;
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
