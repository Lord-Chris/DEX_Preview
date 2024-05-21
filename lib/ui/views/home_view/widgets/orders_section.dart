import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';
import '../home_viewmodel.dart';

class OrdersSection extends ViewModelWidget<HomeViewModel> {
  const OrdersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      color: context.cScheme.background,
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: context.cScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: OrdersViewEnum.values
                        .map((filter) => SizedBox(
                              width: 159,
                              child: SectionItem(
                                label: filter.value,
                                isActive: viewModel.ordersView == filter,
                                onTap: () => viewModel.setOrdersView(filter),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Spacing.vertRegular(),
          Container(
            color: context.cScheme.background,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 72),
            child: Column(
              children: [
                const Text(
                  'No Open Orders',
                  style: AppTextStyles.bold18,
                ),
                Spacing.vertSmall(),
                Text(
                  'Lorem ipsum dolor sit amet, consectetura dipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium14.copyWith(
                    color: context.cScheme.onSecondary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
