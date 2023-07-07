import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCartEvent extends CartEvent {}

class GetAllCartEvent extends CartEvent {}

class LoadingCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartEntity cart;
  AddToCartEvent(this.cart);

  @override
  List<Object?> get props => [cart];
}

class DecreaseCartProductItemEvent extends CartEvent {
  final int productId;

  DecreaseCartProductItemEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class IncreaseCartProductItemEvent extends CartEvent {
  final int productId;

  IncreaseCartProductItemEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveCartProductEvent extends CartEvent {
  final int productId;

  RemoveCartProductEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}
