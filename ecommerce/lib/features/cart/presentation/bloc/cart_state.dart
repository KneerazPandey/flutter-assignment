import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCartState extends CartState {}

class SuccessfullyObtainAllCartState extends CartState {
  final List<CartEntity> carts;

  SuccessfullyObtainAllCartState(this.carts);

  @override
  List<Object?> get props => [carts];
}

class SuccessfullyAddedNewCartState extends CartState {}

class LoadingCartState extends CartState {}

class CartFailureState extends CartState {
  final String message;

  CartFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

class SuccessfullyDecreasedCartProductItemState extends CartState {}

class SuccessfullyIncreasedCartProductItemState extends CartState {}

class SuccessfullyRemovedCartProductState extends CartState {}
