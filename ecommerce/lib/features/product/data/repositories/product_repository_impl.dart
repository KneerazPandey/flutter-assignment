import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  const ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      List<ProductEntity> products = await remoteDataSource.getAllProducts();
      return Right(products);
    } on Http400BadRequestException catch (failure) {
      return Left(Http400BadRequestFailure(failure.message));
    } on Http404NotFoundException catch (failure) {
      return Left(Http404NotFoundFailure(failure.message));
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail(int id) async {
    try {
      ProductEntity product = await remoteDataSource.getProductDetail(id);
      return Right(product);
    } on Http400BadRequestException catch (failure) {
      return Left(Http400BadRequestFailure(failure.message));
    } on Http404NotFoundException catch (failure) {
      return Left(Http404NotFoundFailure(failure.message));
    } on FormatException catch (failure) {
      return Left(FormatFailure(failure.message));
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
