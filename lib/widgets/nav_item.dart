import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.name,
    required this.icon,
    required this.isSelected,
    this.onPressed,
  });

  final String name;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected
        ? Colors.white
        : AppColors.mutedForeground;
    final backgroundColor = isSelected ? AppColors.primary : Colors.transparent;

    return Expanded(
      flex: isSelected ? 2 : 1,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(999),
          child: SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: isSelected ? 8 : 0,
              children: [
                Icon(icon, size: 20, color: foregroundColor),
                if (isSelected)
                  Text(
                    name,
                    style: TextStyle(
                      color: foregroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
