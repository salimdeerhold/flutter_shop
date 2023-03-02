import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
//   https://dribbble.com/shots/16755367-WECOM-Ecommerce-App/attachments/11803289?mode=media
  final String? imageUrl;
  final String productName;
  final double productPrice;

  const ProductCart(
      {Key? key,
      this.imageUrl,
      required this.productName,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170,
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            imageUrl!=null ? 
            Image.network(
              //'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
              imageUrl!,
              height: 70,
              width: 100,
              fit: BoxFit.cover,
            ):const SizedBox(child: Icon(Icons.error),height: 70,width: 100,),

            const SizedBox(height: 2),
            Text(
              productName,
              style: TextStyle(fontSize: 10),
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "\$ $productPrice",
                  style:const TextStyle(fontSize: 17),
                  maxLines: 2,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 14,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ));
  }
}
