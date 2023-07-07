import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/decrease_cart_product_item.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_all_cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/increase_cart_product_item.dart';
import 'package:ecommerce/features/cart/domain/usecases/remove_cart_product.dart';
import 'package:ecommerce/features/cart/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCart getAllCart;
  final AddToCart addToCart;
  final IncreaseCartProductItem increaseCartProductItem;
  final DecreaseCartProductItem decreaseCartProductItem;
  final RemoveCartProduct removeCartProduct;

  CartBloc({
    required this.getAllCart,
    required this.addToCart,
    required this.decreaseCartProductItem,
    required this.increaseCartProductItem,
    required this.removeCartProduct,
  }) : super(InitialCartState()) {
    on<InitialCartEvent>((event, emit) {
      emit(InitialCartState());
    });

    on<GetAllCartEvent>((event, emit) async {
      var getAllCartEither = await getAllCart(const NoParams());
      getAllCartEither.fold(
        (failure) {
          emit(CartFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyObtainAllCartState(products));
        },
      );
    });

    on<AddToCartEvent>((event, emit) async {
      var addedToCartEither =
          await addToCart(AddToCartParams(cart: event.cart));
      addedToCartEither.fold(
        (failure) {
          emit(CartFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyAddedNewCartState());
        },
      );
    });

    on<IncreaseCartProductItemEvent>((event, emit) async {
      var increaseEither = await increaseCartProductItem(
        IncreaseCartProductItemParams(
          productId: event.productId,
        ),
      );
      increaseEither.fold(
        (failure) {
          emit(CartFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyIncreasedCartProductItemState());
        },
      );
    });

    on<DecreaseCartProductItemEvent>((event, emit) async {
      var decreaseEither = await decreaseCartProductItem(
        DecreaseCartProductItemParams(
          productId: event.productId,
        ),
      );
      decreaseEither.fold(
        (failure) {
          emit(CartFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyDecreasedCartProductItemState());
        },
      );
    });

    on<RemoveCartProductEvent>((event, emit) async {
      var removedEither = await removeCartProduct(
        RemoveCartProductParams(
          productId: event.productId,
        ),
      );
      removedEither.fold(
        (failure) {
          emit(CartFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyRemovedCartProductState());
        },
      );
    });
  }
}
