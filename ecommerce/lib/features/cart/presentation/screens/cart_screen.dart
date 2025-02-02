import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/presentation/bloc/bloc.dart';
import 'package:ecommerce/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/widgets/custom_elevated_button.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(
      GetAllCartEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            BlocProvider.of<CartBloc>(context).add(
              InitialCartEvent(),
            );
            Navigator.pop(context);
          },
        ),
        title: const Text('Cart page'),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is SuccessfullyRemovedCartProductState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Successfully removed product from cart',
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
            setState(() {
              totalPrice = 0;
            });
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
              GetAllCartEvent(),
            );
          }
          if (state is SuccessfullyDecreasedCartProductItemState) {
            BlocProvider.of<CartBloc>(context).add(
              GetAllCartEvent(),
            );
            setState(() {
              totalPrice = 0;
            });
          }
          if (state is SuccessfullyIncreasedCartProductItemState) {
            BlocProvider.of<CartBloc>(context).add(
              GetAllCartEvent(),
            );
            setState(() {
              totalPrice = 0;
            });
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is SuccessfullyObtainAllCartState) {
              for (var cart in state.carts) {
                totalPrice += (cart.count * cart.product.price);
              }
              if (state.carts.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.carts.length,
                          itemBuilder: (BuildContext context, int index) {
                            CartEntity cart = state.carts[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 30,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 130,
                                    child: Image.network(
                                      cart.product.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          cart.product.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '\$${cart.product.price.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Total: \$${cart.product.price * cart.count}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                  fontSize: 17,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    CartBloc>(
                                                                context)
                                                            .add(
                                                          IncreaseCartProductItemEvent(
                                                            cart.product.id,
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        FontAwesomeIcons.plus,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      cart.count.toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.green,
                                                            fontSize: 22,
                                                          ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        if (cart.count >= 1) {
                                                          BlocProvider.of<
                                                                      CartBloc>(
                                                                  context)
                                                              .add(
                                                            DecreaseCartProductItemEvent(
                                                              cart.product.id,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        FontAwesomeIcons.minus,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            IconButton(
                                              onPressed: () async {
                                                BlocProvider.of<CartBloc>(
                                                        context)
                                                    .add(
                                                  RemoveCartProductEvent(
                                                    cart.product.id,
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.xmark,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                            Text(
                              '\$ ${totalPrice.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      Lottie.asset('assets/empty_cart.json'),
                      const SizedBox(height: 10),
                      const Text('There is currently no any carts to display.'),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: CustomElevatedButton(
                          onPressed: () async {
                            await Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (route) => false,
                            );
                          },
                          buttonName: 'Continue Shopping',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              }
            } else {
              return Center(
                child: Lottie.asset('assets/loading.json'),
              );
            }
          },
        ),
      ),
    );
  }
}
