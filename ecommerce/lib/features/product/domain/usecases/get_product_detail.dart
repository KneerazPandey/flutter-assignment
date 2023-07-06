import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetProductDetail extends UseCase<ProductEntity, ProductDetailParams> {
  final ProductRepository repository;

  GetProductDetail(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(
    ProductDetailParams params,
  ) async {
    return await repository.getProductDetail(params.id);
  }
}

class ProductDetailParams extends Equatable {
  final int id;

  const ProductDetailParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
