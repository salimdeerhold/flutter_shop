import 'package:flutter/material.dart';
import 'package:flutter_proj_06/notifier/cart_notifier.dart';
import 'package:flutter_proj_06/common/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/const.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';



class DetailPage extends ConsumerWidget {
  final Product product;
  const DetailPage(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
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
                Image.network(
                  product.image,
                  height: 220,
                  width: double.maxFinite,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingSection(
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
                  descriptionTitle: 'Category',
                  descriptionBody: product.category,
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: 'Description',
                  descriptionBody: product.description,
                ),
                CustomButton(
                  onPress: () {
                    ref.read(cartProvider.notifier).addToCart(product);
                    showSnackBar(context, 'added');
                  },
                  icon: Icons.shopping_cart,
                  text: 'Add To Cart',
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

class RatingSection extends StatelessWidget {
  const RatingSection({Key? key, this.rate, this.count}) : super(key: key);
  final double? rate;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardWithIconNText(icon: Icons.star, text: rate.toString()),
        const SizedBox(
          width: 4,
        ),
        Text('\($count ratings\)',
            style: const TextStyle(color: AppColor.kRatingText)),
      ],
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection(
      {Key? key, required this.descriptionTitle, required this.descriptionBody})
      : super(key: key);
  final String descriptionTitle;
  final String descriptionBody;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descriptionTitle,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              descriptionBody,
              style: const TextStyle(
                fontSize: 14,
              ),
            ))
      ],
    );
  }
}
