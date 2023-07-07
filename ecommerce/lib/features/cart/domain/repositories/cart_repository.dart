import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getAllCart();

  Future<Either<Failure, bool>> addToCart(CartEntity cart);

  Future<Either<Failure, bool>> removeCartProduct(int productId);

  Future<Either<Failure, bool>> increaseCartProductItem(int productId);

  Future<Either<Failure, bool>> decreaseCartProductItem(int productId);
}
