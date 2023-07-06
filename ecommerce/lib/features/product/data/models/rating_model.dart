import 'dart:convert';
import 'package:ecommerce/features/product/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      rate: (map['rate'] as num).toDouble(),
      count: map['count'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory RatingModel.fromJson(String source) {
    return RatingModel.fromMap(jsonDecode(source));
  }
}
