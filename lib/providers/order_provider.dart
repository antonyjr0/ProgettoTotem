import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/models/order_item.dart';
import 'package:progetto_totem/services/utils.dart';

class OrderProvider extends StateNotifier<OrderItem?> {
  OrderProvider() : super(null);

  void init() {
    state = OrderItem(rows: []);
  }

  void addRow(String productId) {
    state?.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
  }

  Future removeRow(String productId) async {
    // ignore: collection_methods_unrelated_type
    state?.rows.remove(state?.rows.where((row) => row.productId == productId));
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
