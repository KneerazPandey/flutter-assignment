import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class IncreaseCartProductItem
    extends UseCase<bool, IncreaseCartProductItemParams> {
  final CartRepository repository;

  IncreaseCartProductItem(this.repository);

  @override
  Future<Either<Failure, bool>> call(
      IncreaseCartProductItemParams params) async {
    return await repository.increaseCartProductItem(params.productId);
  }
}

class IncreaseCartProductItemParams extends Equatable {
  final int productId;

  const IncreaseCartProductItemParams({
    required this.productId,
  });

  @override
  List<Object?> get props => throw [productId];
}
