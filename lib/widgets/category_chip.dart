import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:pos_public/core/theme/app_shadows.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.isSelected,
    required this.name,
    required this.imageUrl,
  });

  final bool isSelected;
  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.card,
        boxShadow: isSelected ? null : AppShadows.cardShadow,
        borderRadius: BorderRadius.circular(999),
      ),
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        spacing: 8,
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          Container(
            width: 28,
            height: 28,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.border,
            ),
            child: imageUrl == null
                ? Image.asset('assets/images/no-image.jpg', fit: .cover)
                : Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    width: 28,
                    height: 28,
                  ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: .w600,
              color: isSelected ? AppColors.card : AppColors.cardForeground,
            ),
          ),
        ],
      ),
    );
  }
}
