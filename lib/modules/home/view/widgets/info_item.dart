import 'package:flutter/material.dart';
import 'package:rick_and_morty_dex/modules/shared/colors/colors.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const InfoItem({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: AppColors.secondary),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
