import 'package:ecommerce/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:ecommerce/features/cart/data/datasources/cart_remote_data_source_impl.dart';
import 'package:ecommerce/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/cart/domain/usecases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/decrease_cart_product_item.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_all_cart.dart';
import 'package:ecommerce/features/cart/domain/usecases/increase_cart_product_item.dart';
import 'package:ecommerce/features/cart/domain/usecases/remove_cart_product.dart';
import 'package:ecommerce/features/cart/presentation/bloc/bloc.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product_detail.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() {
  productInjection();
  cartInjection();
  globalInjection();
}

Future<void> productInjection() async {
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(
      getAllProducts: sl(),
      getProductDetail: sl(),
    ),
  );

  sl.registerLazySingleton<GetAllProducts>(
    () => GetAllProducts(sl()),
  );

  sl.registerLazySingleton<GetProductDetail>(
    () => GetProductDetail(sl()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(client: sl()),
  );
}

void globalInjection() {
  sl.registerLazySingleton<Client>(
    () => Client(),
  );

  sl.registerLazySingleton<Future<SharedPreferences>>(
    () => SharedPreferences.getInstance(),
  );
}

void cartInjection() {
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      getAllCart: sl(),
      addToCart: sl(),
      decreaseCartProductItem: sl(),
      increaseCartProductItem: sl(),
      removeCartProduct: sl(),
    ),
  );

  sl.registerLazySingleton<GetAllCart>(
    () => GetAllCart(sl()),
  );

  sl.registerLazySingleton<AddToCart>(
    () => AddToCart(sl()),
  );

  sl.registerLazySingleton<DecreaseCartProductItem>(
    () => DecreaseCartProductItem(sl()),
  );

  sl.registerLazySingleton<IncreaseCartProductItem>(
    () => IncreaseCartProductItem(sl()),
  );

  sl.registerLazySingleton<RemoveCartProduct>(
    () => RemoveCartProduct(sl()),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localDataSource: sl()),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );
}
