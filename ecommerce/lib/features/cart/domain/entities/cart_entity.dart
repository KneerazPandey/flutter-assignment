import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final ProductEntity product;
  final int count;
  final String date;

  const CartEntity({
    required this.product,
    required this.count,
    required this.date,
  });

  @override
  List<Object?> get props => [product, count, date];
}
