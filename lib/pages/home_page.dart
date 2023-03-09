import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj_06/common/navigation.dart';
import 'package:flutter_proj_06/const/strings.dart';
import 'package:flutter_proj_06/pages/search_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/const.dart';
import '../models/product/product.dart';
import '../widgets/widgets.dart';
import 'cart_page.dart';
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
      appBar: CustomAppBar(
        title: AppString.homePageTitle,
        trailingIcon: Icons.search,
        trailingIconOnPress:(){
          navigateTo(context,  SearchPage());
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        width: double.infinity,
        color: AppColor.kBackground,
        child: future.when(
          data: (productList) => _buildPosts(context, productList),
          error: (error, stack) => Text(error.toString()),
          loading: () => Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 8,
                ),
                Text(
                  AppString.loading,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ])),
        ),
      ),
    );
  }
}

Widget _buildPosts(BuildContext context, List<Product> productList) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const OfferSection(),
        GridView.builder(
            shrinkWrap: true,
            primary: false,
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(product)));
                },
                child: ProductCart(
                  productName: product.title,
                  productPrice: product.price,
                  imageUrl: product.image,
                ),
              );
            }),
      ],
    ),
  );
}




class OfferSection extends StatelessWidget {
  const OfferSection({Key? key}) : super(key: key);
  final imageUrl =
      'https://images.unsplash.com/photo-1544441893-675973e31985?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: double.maxFinite,
        height: 90,
        decoration: BoxDecoration(
            color: const Color(0xff393a3c),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(imageUrl),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Save up to 10%',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColor.kBackground,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Clothes Collection',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.kBackground,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
