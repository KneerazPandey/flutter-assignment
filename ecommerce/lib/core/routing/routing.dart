import 'package:ecommerce/features/product/presentation/screens/product_detail_screen.dart';
import 'package:ecommerce/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Routing {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const HomeScreen(),
        );
      case ProductDetailScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ProductDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              title: const Text('Page Not Found'),
            ),
            body: Center(
              child: Text(
                '404 Page Not Found',
                style: GoogleFonts.sansita(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
    }
  }
}
