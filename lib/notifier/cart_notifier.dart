import 'package:flutter_proj_06/models/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier,List<Product>>((ref) => CartNotifier());



class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state =[...state,product];
  }

  void removeFromCart(int productId) {
    state = [
          for(final product in state)
            if(product.id != productId )product,
    ];

  }
}
