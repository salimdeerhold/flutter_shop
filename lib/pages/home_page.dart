import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj_06/models/product/product.dart';
import 'package:flutter_proj_06/widgets/product_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FutureBuilder<List<Product>> _buildBody(BuildContext context) {
    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Product>>(
      future: client.getProductList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Product> productList = snapshot.data!;
          return _buildPosts(context, productList);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('buid: Homepage');

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        color: Colors.amber,
        child: _buildBody(context),
      ),
    );
  }
}

GridView _buildPosts(BuildContext context, List<Product> productList) {
  return GridView.builder(
    
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 0.9
    ),
    itemBuilder: (context, index) {
      Product product = productList[index];
      return ProductCart(productName: product.title,productPrice: product.price,);
    },
    itemCount: productList.length,
  );
}

/*
GridView.builder(
      //crossAxisCount: 2,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        Product product = productList[index];
        return  GestureDetector(
          onTap: ()=>{
           // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DetailPage(news.articles[index])))
          },
          child: ProductCart(productName: product.title,productPrice: product.price,), 
        );
      },
      gridDelegate: SilverGridDele ,
      
    );
*/

/*
  ListTile( 
             // leading: Image.network(product.image[index],height: 100,width: 100,),
              title: Text(
                product.title,
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              //subtitle: Text("Published on: "+news.articles[index].publishedAt.toString()),
            ),

            */