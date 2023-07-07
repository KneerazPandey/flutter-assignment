import 'dart:convert';

import 'package:ecommerce/features/product/data/models/rating_model.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: (map['price'] as num).toDouble(),
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: RatingModel.fromMap(map['rating']),
    );
  }

  factory ProductModel.fromJson(String source) {
    return ProductModel.fromMap(jsonDecode(source));
  }

  Map<String, dynamic> toMap() {
    RatingModel ratingModel = RatingModel(
      rate: rating.rate,
      count: rating.count,
    );
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': ratingModel.toMap(),
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  static List<ProductModel> generateProductList(List<dynamic> datas) {
    List<ProductModel> products = [];

    for (var data in datas) {
      ProductModel product = ProductModel.fromMap(data);
      products.add(product);
    }

    return products;
  }

  static List<ProductModel> generateProductListFromJson(String source) {
    List<dynamic> datas = jsonDecode(source);
    return generateProductList(datas);
  }
}
