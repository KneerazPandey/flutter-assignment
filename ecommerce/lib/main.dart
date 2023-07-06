import 'package:ecommerce/core/constants/app_theme.dart';
import 'package:ecommerce/core/routing/routing.dart';
import 'package:ecommerce/dependency_injection.dart' as di;
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(
            getAllProducts: di.sl(),
            getProductDetail: di.sl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings routeSettings) =>
            Routing.onGenerateRoute(routeSettings),
        home: const HomeScreen(),
      ),
    );
  }
}
