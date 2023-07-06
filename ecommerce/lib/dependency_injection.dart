import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce/features/product/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product_detail.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final sl = GetIt.instance;

void init() {
  productInjection();
  globalInjection();
}

void productInjection() {
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
  sl.registerLazySingleton<Client>(() => Client());
}
