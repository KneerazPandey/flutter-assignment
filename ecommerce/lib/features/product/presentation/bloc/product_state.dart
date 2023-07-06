import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProductState extends ProductState {}

class SuccessfullyObtainAllProductsState extends ProductState {
  final List<ProductEntity> products;

  SuccessfullyObtainAllProductsState(this.products);

  @override
  List<Object?> get props => [products];
}

class SuccessfullyObtainProductDetailState extends ProductState {
  final ProductEntity product;

  SuccessfullyObtainProductDetailState(this.product);

  @override
  List<Object?> get props => [product];
}

class LoadingProductState extends ProductState {}

class ProductFailureState extends ProductState {
  final String message;

  ProductFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
