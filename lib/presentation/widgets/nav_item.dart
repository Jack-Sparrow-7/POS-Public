import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.surface : AppColors.textLight,
              size: 20,
            ),
            const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.surface,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
