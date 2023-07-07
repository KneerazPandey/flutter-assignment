import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  const CartRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> addToCart(CartEntity cart) async {
    try {
      bool created = await localDataSource.addToCart(cart);
      return Right(created);
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on CacheException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getAllCart() async {
    try {
      List<CartEntity> carts = await localDataSource.getAllCart();
      return Right(carts);
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on CacheException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, bool>> decreaseCartProductItem(int productId) async {
    try {
      bool decreased = await localDataSource.decreaseCartProductItem(productId);
      return Right(decreased);
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on CacheException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, bool>> increaseCartProductItem(int productId) async {
    try {
      bool updated = await localDataSource.increaseCartProductItem(productId);
      return Right(updated);
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on CacheException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, bool>> removeCartProduct(int productId) async {
    try {
      bool removed = await localDataSource.removeCartProduct(productId);
      return Right(removed);
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on CacheException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
