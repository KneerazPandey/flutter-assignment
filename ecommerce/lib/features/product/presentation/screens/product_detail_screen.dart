import 'package:ecommerce/features/product/presentation/widgets/product_detail_body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: SafeArea(
        child: ProductDetailBody(
          id: (data['id'] as num).toInt(),
        ),
      ),
    );
  }
}
