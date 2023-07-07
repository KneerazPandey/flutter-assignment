import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';

class GetAllCart extends UseCase<List<CartEntity>, NoParams> {
  final CartRepository repository;

  GetAllCart(this.repository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(NoParams params) async {
    return await repository.getAllCart();
  }
}
