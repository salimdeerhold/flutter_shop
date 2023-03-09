import 'package:flutter/material.dart';
import 'package:flutter_proj_06/const/colors.dart';
import 'package:flutter_proj_06/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import 'detail_page.dart';




class SearchPage extends ConsumerWidget {
  SearchPage({Key? key}) : super(key: key);
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final productList = ref.watch(pLProvider).value??[];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                //autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_circle_right),
                      iconSize: 40,
                      color: AppColor.kPrimary,
                      splashRadius: 40,
                      splashColor: AppColor.kPrimary,
                      onPressed: () {}),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: AppColor.kPrimary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: AppColor.kPrimary),
                  ),
                  hintText: 'Search ...',
                ),
              ),
              Expanded(
                child: GridView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
