import 'package:flutter/material.dart';
import 'package:flutter_proj_06/common/navigation.dart';
import 'package:flutter_proj_06/const/colors.dart';
import 'package:flutter_proj_06/const/strings.dart';
import 'package:flutter_proj_06/models/models.dart';
import 'package:flutter_proj_06/widgets/appbar/appbar.dart';
import 'package:flutter_proj_06/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/cart_notifier.dart';
import '../provider/total_price_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> productList = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: CustomAppBar(
        leadingIcon: Icons.chevron_left,
        leadingIconOnPress: () {
          navigateBackTo(context);
        },
        title: AppString.cartPageTitle,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: ((context, index) => Padding(
                      padding:
                          const EdgeInsets.only(left: 4.0, right: 4.0, top: 4),
                      child: ListTile(
                        tileColor: AppColor.kWhite,
                        leading: Image.network(
                          productList[index].image,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          productList[index].title,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          "\$ ${productList[index].price.toString()}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        trailing: IconButton(
                            icon:const Icon(Icons.close), onPressed: () {
                              ref.read(cartProvider.notifier).removeFromCart(productList[index].id);
                            }),
                      ),
                    ))),
          ),
          Container(
            width: double.maxFinite,
            height: 30,
            alignment: Alignment.center,
            decoration:const  BoxDecoration(
              color: AppColor.kBackground,
              border: Border(top: BorderSide())),
            child: Text('Total ${ref.watch(totalPriceProvider)}',style: const TextStyle(fontSize: 17),),
          ),
          CustomButton(
            onPress: () {},
            text: AppString.checkout,
            padding: const EdgeInsets.all(4),
          )
        ],
      ),
    );
  }
}


