import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductTile extends StatelessWidget {
  final ProductEntity product;

  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: -14,
              right: -14,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.heart,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                product.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.amberAccent,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      product.rating.rate.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 2),
                    const Text('|'),
                    const SizedBox(width: 2),
                    Text(
                      product.rating.count.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Text(
                  '\$23',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
