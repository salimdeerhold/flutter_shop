import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj_06/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'detail_page.dart';

String categorySelected = 'electronics';

final categoryProvider = FutureProvider<List<String>>((ref) async {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  List<String> categoryList = await client.getCategoriesList();
  return categoryList;
});

class CategoryPage extends ConsumerWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("catefory page build----------------------------");
    return Scaffold(
        appBar:const CustomAppBar(title: 'Category'),
         body: _buildBody(),);
  }
}

_buildBody() {
  return Column(
    children: const [
      CategoryListSection(),
      CategoryDataSection(),
    ],
  );
}



class CategoryListSection extends ConsumerWidget {
  const CategoryListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryFuture = ref.watch(categoryProvider);
    print("catefory list section build----------------------------");
 
    return categoryFuture.when(
      data: (data) => SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: ()async {
              categorySelected = data[index];
              print(categorySelected);
              ref.read(catSelProvider.notifier).state = categorySelected;
              // todo
              // change the value that has been sent in parameter while calling api method 
            },
            child: CardWithIconNText(
              text: data[index],
              padding: 4,
              margin: 5,
            ),
          ),
        ),
      ),
      error: (error, stack) => Text(error.toString()),
      loading: () => const Center(child: CustomCircularProgressIndicator()),
    );
  }
}

final categoryDataProvider = FutureProvider<List<Product>>((ref) async {
  final value =ref.watch(catSelProvider);
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  List<Product> categoryDataList =
      await client.getCategoriesDataList(value);
  return categoryDataList;
});

class CategoryDataSection extends ConsumerWidget {
  const CategoryDataSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("catefory data section build----------------------------");

    final future = ref.watch(categoryDataProvider);
    return Expanded(
      child: Container(
        child: future.when(
          data: (productList) => GridView.builder(
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
          error: (error, stack) => Text(error.toString()),
          loading: () =>const Center(child: CustomCircularProgressIndicator(size: 10)),
        ),
      ),
    );
  }
}

final catSelProvider = StateProvider<String>((ref)=>categorySelected);


