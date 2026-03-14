import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/core/theme/app_shadows.dart';
import 'package:pos_public/models/menu/menu_product/menu_product.dart';
import 'package:uicons/uicons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final MenuProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppShadows.cardShadow,
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: product.imageUrl == null
                  ? Image.asset('assets/images/no-image.jpg', fit: BoxFit.cover)
                  : Image.network(product.imageUrl!, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    product.description ??
                        "Product Description not mentioned by the store",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "₹${product.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton.filled(
                        constraints: const BoxConstraints(
                          maxHeight: 32,
                          maxWidth: 32,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        onPressed: () {},
                        icon: Icon(UIcons.regularRounded.plus_small),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
