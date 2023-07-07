import 'dart:async';
import 'dart:io';

import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/errors/http_error_handling.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:http/http.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Client client;

  const ProductRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final Uri uri = Uri.parse('https://fakestoreapi.com/products');
      Response response = await client.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return HttpErrorHandling<List<ProductModel>>().handleHttpError(
        response: response,
        onSuccess: () {
          return ProductModel.generateProductListFromJson(response.body);
        },
      );
    } on SocketException {
      throw const ServerException(
        "No internet connection, Unable to connect to server",
      );
    } on TimeoutException {
      throw const ServerException(
        "Server Request Time Out. Please Try Again!",
      );
    }
  }

  @override
  Future<ProductModel> getProductDetail(int id) async {
    try {
      final Uri uri = Uri.parse('https://fakestoreapi.com/products/$id');
      Response response = await client.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return HttpErrorHandling<ProductModel>().handleHttpError(
        response: response,
        onSuccess: () {
          return ProductModel.fromJson(response.body);
        },
      );
    } on SocketException {
      throw const ServerException(
        "No internet connection, Unable to connect to server",
      );
    } on TimeoutException {
      throw const ServerException(
        "Server Request Time Out. Please Try Again!",
      );
    }
  }
}
