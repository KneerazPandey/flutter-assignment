import 'package:ecommerce/core/usecases/use_case.dart';
import 'package:ecommerce/features/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product_detail.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final GetProductDetail getProductDetail;

  ProductBloc({
    required this.getAllProducts,
    required this.getProductDetail,
  }) : super(InitialProductState()) {
    on<InitialProductEvent>((event, emit) {
      emit(InitialProductState());
    });

    on<GetAllProductsEvent>((event, emit) async {
      var getAllProductsEither = await getAllProducts(const NoParams());
      getAllProductsEither.fold(
        (failure) {
          emit(ProductFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyObtainAllProductsState(products));
        },
      );
    });

    on<GetProductDetailEvent>((event, emit) async {
      var getAllProductsEither = await getProductDetail(
        ProductDetailParams(id: event.id),
      );
      getAllProductsEither.fold(
        (failure) {
          emit(ProductFailureState(failure.message));
        },
        (products) {
          emit(SuccessfullyObtainProductDetailState(products));
        },
      );
    });
  }
}
