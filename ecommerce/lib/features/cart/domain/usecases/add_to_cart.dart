import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class AddToCart extends UseCase<bool, AddToCartParams> {
  final CartRepository repository;

  AddToCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(AddToCartParams params) async {
    return await repository.addToCart(params.cart);
  }
}

class AddToCartParams extends Equatable {
  final CartEntity cart;

  const AddToCartParams({
    required this.cart,
  });

  @override
  List<Object?> get props => throw [cart];
}
