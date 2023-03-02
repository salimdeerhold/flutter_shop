import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../rating/rating.dart';

part 'product.g.dart';


const BASE_URL = 'https://fakestoreapi.com';


@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/products?limit=5")
  Future<List<Product>> getProductList();
}



@JsonSerializable()
class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
