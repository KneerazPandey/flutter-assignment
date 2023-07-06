import 'package:ecommerce/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<ProductModel> getProductDetail(int id);
}
