import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/common.dart';
import '../const/const.dart';
import '../models/models.dart';
import '../notifier/notifier.dart';
import '../widgets/widgets.dart';



class DetailPage extends ConsumerWidget {
  final Product product;
  const DetailPage(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(leadingIcon:Icons.chevron_left,leadingIconOnPress:(){navigateBackTo(context);},),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: AppColor.kBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  color: AppColor.kWhite,
                  child: Image.network(
                    product.image,
                    height: 220,
                    width: double.maxFinite,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingSectionCard(
                  rate: product.rating.rate,
                  count: product.rating.count,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle:AppString.category ,
                  descriptionBody: product.category,
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: AppString.description,
                  descriptionBody: product.description,
                ),
                CustomButton(
                  onPress: () {
                    ref.read(cartProvider.notifier).addToCart(product);
                    showSnackBar(context, 'Added To Cart');
                    navigateBackTo(context);
                  },
                  icon: Icons.shopping_cart,
                  text: AppString.addToCart,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
