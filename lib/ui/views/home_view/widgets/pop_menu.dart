import 'package:flutter/material.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';

class PopMenu extends StatelessWidget {
  final OverlayPortalController controller;
  const PopMenu({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + 5,
      right: 5,
      child: SizedBox(
        width: 214,
        child: Material(
          color: context.theme.cardColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!context.isDark)
                const AppTextField(
                  hint: 'Search',
                  suffix: Icon(
                    Icons.search,
                    color: AppColors.blue,
                  ),
                ),
              ...['Exchange', 'Wallets', 'Roqqu Hub', 'Log out'].map(
                (e) => InkWell(
                  onTap: () => controller.toggle(),
                  child: Container(
                    color: e == 'Wallets' ? context.cScheme.secondary : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 13),
                    child: Text(
                      e,
                      style: AppTextStyles.medium16.copyWith(
                        color: context.cScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
