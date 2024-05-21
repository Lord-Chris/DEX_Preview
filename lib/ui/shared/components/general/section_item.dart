import 'package:flutter/material.dart';

import '../../../../core/_core.dart';
import '../../_shared.dart';

class SectionItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color? activeBorderColor;
  final VoidCallback? onTap;

  const SectionItem({
    super.key,
    required this.label,
    this.isActive = false,
    this.activeBorderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(3),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive
              ? context.cScheme.secondaryContainer
                  .withOpacity(context.isDark ? .5 : 1)
              : context.cScheme.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? activeBorderColor ?? context.cScheme.secondary
                : Colors.transparent,
            width: 1,
          ),
          boxShadow: [
            if (isActive && !context.isDark) ...[
              BoxShadow(
                color: AppColors.black.withOpacity(.04),
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ]
          ],
        ),
        child: Text(
          label,
          style: (isActive ? AppTextStyles.bold14 : AppTextStyles.medium14)
              .copyWith(
            color: isActive
                ? context.cScheme.onBackground
                : context.cScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
