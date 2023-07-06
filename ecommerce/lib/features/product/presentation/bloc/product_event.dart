import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProductEvent extends ProductEvent {}

class GetAllProductsEvent extends ProductEvent {}

class GetProductDetailEvent extends ProductEvent {
  final int id;
  GetProductDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadingProductEvent extends ProductEvent {}
