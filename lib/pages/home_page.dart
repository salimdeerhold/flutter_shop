import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj_06/const/colors.dart';
import 'package:flutter_proj_06/models/product/product.dart';
import 'package:flutter_proj_06/widgets/appbar/appbar.dart';
import 'package:flutter_proj_06/widgets/product_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'detail_page.dart';

final pLProvider = FutureProvider<List<Product>>((ref) async {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  List<Product> list = await client.getProductList();
  return list;
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(pLProvider);
    return Scaffold(
      appBar:const CustomAppBar(title: 'Shopy',),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        width: double.infinity,
        color: AppColor.kBackground,
        child: future.when(
          data: (productList)=> _buildPosts(context, productList),
          error: (error, stack) => Text(error.toString()),
          loading: ()=>const Center(child: Text('Loading')),
        ),
      ),
    );
  }
}



GridView _buildPosts(BuildContext context, List<Product> productList) {
  return GridView.builder(
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        Product product = productList[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailPage(product)));
          },
          child: ProductCart(
            productName: product.title,
            productPrice: product.price,
            imageUrl: product.image,
          ),
        );
      });
}
