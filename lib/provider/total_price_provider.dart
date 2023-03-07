import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../notifier/cart_notifier.dart';

final totalPriceProvider = Provider<double>((ref) {
  final List<Product> list = ref.watch(cartProvider);
  if (list.isEmpty) {
    return 0;
  } else {
    double total = 0.0;
    for (final p in list) {
      total += p.price;
    }
    return total;
  }
});
