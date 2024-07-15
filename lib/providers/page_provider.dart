//provider per controllare la paginazine nella order_screen
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProvider extends StateNotifier<int> {
  PageProvider() : super(0);

  void resetPage() => state = 0;
  void nextPage(int totalItems, int itemsPerPage) {
    if ((state + 1) * itemsPerPage < totalItems) {
      state++;
    }
  }

  void previousPage() {
    if (state > 0) {
      state--;
    }
  }
}

final pageProvider = StateNotifierProvider<PageProvider, int>((ref) {
  return PageProvider();
});
