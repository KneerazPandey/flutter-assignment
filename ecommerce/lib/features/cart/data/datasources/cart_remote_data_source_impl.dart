import 'dart:convert';

import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String cartLocalStorageName = 'cart-name-for-shared-preference';

  final Future<SharedPreferences> sharedPreferences;

  CartLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> addToCart(CartEntity cart) async {
    try {
      bool isAdded = false;
      SharedPreferences pref = await sharedPreferences;
      List<CartModel> carts = await getAllCart();
      List<CartModel> cartToSaveInLocalStorage = [];

      for (var item in carts) {
        if (item.product.id == cart.product.id) {
          CartModel updatedCart = CartModel(
            product: item.product,
            count: cart.count + item.count,
            date: DateTime.now().toIso8601String(),
          );
          cartToSaveInLocalStorage.add(updatedCart);
          isAdded = true;
        } else {
          cartToSaveInLocalStorage.add(item);
        }
      }

      List<String> items = [];
      for (var item in cartToSaveInLocalStorage) {
        items.add(item.toJson());
      }

      if (!isAdded) {
        CartModel model = CartModel(
          product: cart.product,
          count: cart.count,
          date: cart.date,
        );
        items.add(model.toJson());
      }

      pref.setStringList(
        CartLocalDataSourceImpl.cartLocalStorageName,
        items,
      );
      return true;
    } on FormatException {
      throw const FormatException("Unable to save your cart as it is invalid");
    } on Exception {
      throw const CacheException("Unable to save your product to cart");
    }
  }

  @override
  Future<List<CartModel>> getAllCart() async {
    SharedPreferences pref = await sharedPreferences;
    try {
      List<CartModel> carts = [];
      List<String>? datas =
          pref.getStringList(CartLocalDataSourceImpl.cartLocalStorageName);
      if (datas == null) {
        return carts;
      }
      if (datas.isEmpty) {
        return carts;
      }

      for (var storedCart in datas) {
        CartModel cart = CartModel.fromMap(jsonDecode(storedCart));
        carts.add(cart);
      }
      return carts;
    } on FormatException {
      throw const FormatException("Error occured while geting your carts");
    } on Exception {
      throw const CacheException("An error occured. Please try again");
    }
  }

  @override
  Future<bool> decreaseCartProductItem(int productId) async {
    try {
      SharedPreferences pref = await sharedPreferences;
      List<CartModel> carts = await getAllCart();

      List<CartModel> cartWithUpdateProductCount = [];
      for (CartModel cart in carts) {
        if (cart.product.id == productId) {
          CartModel updatedCart = CartModel(
            product: cart.product,
            count: cart.count - 1,
            date: DateTime.now().toIso8601String(),
          );
          cartWithUpdateProductCount.add(updatedCart);
        } else {
          cartWithUpdateProductCount.add(cart);
        }
      }

      List<String> items = [];
      for (var item in cartWithUpdateProductCount) {
        items.add(item.toJson());
      }

      pref.setStringList(
        CartLocalDataSourceImpl.cartLocalStorageName,
        items,
      );
      return true;
    } on FormatException {
      throw const FormatException("Error occured while geting your carts");
    } on Exception {
      throw const CacheException("An error occured. Please try again");
    }
  }

  @override
  Future<bool> increaseCartProductItem(int productId) async {
    try {
      SharedPreferences pref = await sharedPreferences;
      List<CartModel> carts = await getAllCart();

      List<CartModel> cartWithUpdateProductCount = [];
      for (CartModel cart in carts) {
        if (cart.product.id == productId) {
          CartModel updatedCart = CartModel(
            product: cart.product,
            count: 1 + cart.count,
            date: DateTime.now().toIso8601String(),
          );
          cartWithUpdateProductCount.add(updatedCart);
        } else {
          cartWithUpdateProductCount.add(cart);
        }
      }

      List<String> items = [];
      for (var item in cartWithUpdateProductCount) {
        items.add(item.toJson());
      }

      pref.setStringList(
        CartLocalDataSourceImpl.cartLocalStorageName,
        items,
      );
      return true;
    } on FormatException {
      throw const FormatException("Error occured while geting your carts");
    } on Exception {
      throw const CacheException("An error occured. Please try again");
    }
  }

  @override
  Future<bool> removeCartProduct(int productId) async {
    try {
      SharedPreferences pref = await sharedPreferences;
      List<CartModel> carts = await getAllCart();

      List<CartModel> cartWithProductRemove = [];
      for (CartModel cart in carts) {
        if (cart.product.id == productId) {
          continue;
        } else {
          cartWithProductRemove.add(cart);
        }
      }

      List<String> items = [];
      for (var item in cartWithProductRemove) {
        items.add(item.toJson());
      }

      pref.setStringList(
        CartLocalDataSourceImpl.cartLocalStorageName,
        items,
      );
      return true;
    } on FormatException {
      throw const FormatException("Error occured while geting your carts");
    } on Exception {
      throw const CacheException("An error occured. Please try again");
    }
  }
}
