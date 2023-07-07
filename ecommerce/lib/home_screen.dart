import 'dart:async';

import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_state.dart';
import 'package:ecommerce/features/product/presentation/screens/product_detail_screen.dart';
import 'package:ecommerce/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductEntity> _products = [];
  final TextEditingController searchController = TextEditingController();
  Timer? _searchingTimer;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetAllProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProductBloc>(context).add(GetAllProductsEvent());
        },
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {},
          child: Scaffold(
            body: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is SuccessfullyObtainAllProductsState) {
                  if (searchController.text.isEmpty) {
                    _products = state.products;
                  }
                  return SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (String value) {
                                    if (_searchingTimer?.isActive ?? false) {
                                      _searchingTimer?.cancel();
                                    }
                                    _searchingTimer = Timer(
                                        const Duration(milliseconds: 800), () {
                                      if (searchController.text.isNotEmpty) {
                                        List<ProductEntity> results = [];
                                        if (value.isEmpty) {
                                          results = state.products;
                                        } else {
                                          results = state.products.where(
                                            (product) {
                                              return product.title
                                                      .toLowerCase()
                                                      .contains(
                                                        value.toLowerCase(),
                                                      ) ||
                                                  product.category
                                                      .toLowerCase()
                                                      .contains(
                                                        value.toLowerCase(),
                                                      );
                                            },
                                          ).toList();
                                        }
                                        setState(() {
                                          _products = results;
                                        });
                                      }
                                    });
                                  },
                                  onSubmitted: (String value) {},
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: 17,
                                        ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromARGB(255, 216, 216, 216)
                                            .withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () async {
                                  Navigator.pushNamed(
                                    context,
                                    CartScreen.routeName,
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.cartPlus,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: GridView.builder(
                              itemCount: _products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 20,
                                childAspectRatio: 5 / 9,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await Navigator.pushNamed(
                                      context,
                                      ProductDetailScreen.routeName,
                                      arguments: {'id': _products[index].id},
                                    );
                                  },
                                  child: ProductTile(
                                    product: state.products[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Lottie.asset('assets/loading.json'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
