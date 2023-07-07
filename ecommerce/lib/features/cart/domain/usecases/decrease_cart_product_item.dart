import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class DecreaseCartProductItem
    extends UseCase<bool, DecreaseCartProductItemParams> {
  final CartRepository repository;

  DecreaseCartProductItem(this.repository);

  @override
  Future<Either<Failure, bool>> call(
      DecreaseCartProductItemParams params) async {
    return await repository.decreaseCartProductItem(params.productId);
  }
}

class DecreaseCartProductItemParams extends Equatable {
  final int productId;

  const DecreaseCartProductItemParams({
    required this.productId,
  });

  @override
  List<Object?> get props => throw [productId];
}
