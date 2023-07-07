import 'dart:convert';

import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.product,
    required super.count,
    required super.date,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product: ProductModel.fromMap(map['product']),
      count: map['count'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    ProductModel productModel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      category: product.category,
      image: product.image,
      rating: product.rating,
    );
    return {
      'product': productModel.toMap(),
      'count': count,
      'date': date,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory CartModel.fromJson(String source) {
    return CartModel.fromMap(jsonDecode(source));
  }
}
