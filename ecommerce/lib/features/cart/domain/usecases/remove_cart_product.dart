import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class RemoveCartProduct extends UseCase<bool, RemoveCartProductParams> {
  final CartRepository repository;

  RemoveCartProduct(this.repository);

  @override
  Future<Either<Failure, bool>> call(RemoveCartProductParams params) async {
    return await repository.removeCartProduct(params.productId);
  }
}

class RemoveCartProductParams extends Equatable {
  final int productId;

  const RemoveCartProductParams({
    required this.productId,
  });

  @override
  List<Object?> get props => throw [productId];
}
