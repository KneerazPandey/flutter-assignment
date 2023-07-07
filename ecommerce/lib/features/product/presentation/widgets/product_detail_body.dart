import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/presentation/bloc/bloc.dart';
import 'package:ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';

class ProductDetailBody extends StatefulWidget {
  final int id;

  const ProductDetailBody({
    super.key,
    required this.id,
  });

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductDetailEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is SuccessfullyAddedNewCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Successfully added to cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          );
          BlocProvider.of<CartBloc>(context).add(
            GetAllCartEvent(),
          );
          Navigator.pushNamed(context, CartScreen.routeName);
        }

        if (state is CartFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.message,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          );
          BlocProvider.of<CartBloc>(context).add(
            InitialCartEvent(),
          );
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is SuccessfullyObtainProductDetailState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ProductBloc>(context).add(
                              GetAllProductsEvent(),
                            );
                            Navigator.pop(context);
                          },
                          icon: const Icon(FontAwesomeIcons.arrowLeft),
                        ),
                        const Spacer(),
                        const Icon(FontAwesomeIcons.shareNodes),
                        const SizedBox(width: 20),
                        const Icon(FontAwesomeIcons.heart),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: NetworkImage(state.product.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.join_left_rounded),
                        const SizedBox(width: 4),
                        Text(
                          state.product.category,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.product.title,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.orangeAccent,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${state.product.rating.rate} Ratings',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '${state.product.rating.count} Reviews',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            state.product.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    CustomElevatedButton(
                      onPressed: () {
                        CartEntity cart = CartEntity(
                          product: state.product,
                          count: 1,
                          date: DateTime.now().toIso8601String(),
                        );
                        BlocProvider.of<CartBloc>(context).add(
                          AddToCartEvent(cart),
                        );
                      },
                      buttonName: 'Add to Cart',
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Lottie.asset('assets/loading.json'),
            );
          }
        },
      ),
    );
  }
}
