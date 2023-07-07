import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';

abstract class CartLocalDataSource {
  Future<List<CartModel>> getAllCart();

  Future<bool> addToCart(CartEntity cart);

  Future<bool> decreaseCartProductItem(int productId) {
    throw UnimplementedError();
  }

  Future<bool> increaseCartProductItem(int productId) {
    throw UnimplementedError();
  }

  Future<bool> removeCartProduct(int productId) {
    throw UnimplementedError();
  }
}
