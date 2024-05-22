import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';
import '../home_viewmodel.dart';

class OrderbookSection extends ViewModelWidget<HomeViewModel> {
  const OrderbookSection({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              _buildArrangement(
                context,
                viewModel,
                AppSvgAssets.arrangement1,
                0,
              ),
              _buildArrangement(
                context,
                viewModel,
                AppSvgAssets.arrangement2,
                1,
              ),
              _buildArrangement(
                context,
                viewModel,
                AppSvgAssets.arrangement3,
                2,
              ),
              const Spacer(),
              PopupMenuButton(
                itemBuilder: (itemBuilder) {
                  return ['5', '10', '20']
                      .map((e) => PopupMenuItem(
                            child: Text(e),
                            onTap: () => viewModel.setDepth(e),
                          ))
                      .toList();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: context.cScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        viewModel.depth.toString(),
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onBackground,
                        ),
                      ),
                      Spacing.horizSmall(),
                      const Icon(
                        CupertinoIcons.chevron_down,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.horizRegular(),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: AppTextStyles.medium12.copyWith(
                              color: context.cScheme.onSecondary,
                            ),
                          ),
                          Text(
                            '(USDT)',
                            style: AppTextStyles.medium12.copyWith(
                              color: context.cScheme.onSecondary,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Amount',
                            style: AppTextStyles.medium12.copyWith(
                              color: context.cScheme.onSecondary,
                            ),
                          ),
                          Text(
                            '(BTC)',
                            style: AppTextStyles.medium12.copyWith(
                              color: context.cScheme.onSecondary,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Total',
                          style: AppTextStyles.medium12.copyWith(
                            color: context.cScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                    Spacing.horizRegular(),
                  ],
                ),
                Spacing.vertSmall(),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.orderbookData?.bids.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = viewModel.orderbookData?.bids[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              const Spacer(flex: 2),
                              Expanded(
                                flex: 5,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 20,
                                        width: constraints.maxWidth / 1.5,
                                        color: AppColors.red.withOpacity(.15),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacing.horizRegular(),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  data?.formattedPrice ?? '0',
                                  style: AppTextStyles.medium12.copyWith(
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  data?.quantity ?? '0',
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.medium12.copyWith(
                                    color: context.cScheme.onBackground,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  data?.total ?? '0',
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.medium12.copyWith(
                                    color: context.cScheme.onBackground,
                                  ),
                                ),
                              ),
                              Spacing.horizRegular(),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Spacing.vertSmall(),

                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '36,641.20',
                      style: AppTextStyles.medium16.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                    Spacing.horizRegular(),
                    const Icon(
                      CupertinoIcons.up_arrow,
                      color: AppColors.green,
                      size: 16,
                    ),
                    Spacing.horizRegular(),
                    Text(
                      '36,641.20',
                      style: AppTextStyles.medium16.copyWith(
                        color: context.cScheme.onBackground,
                      ),
                    ),
                  ],
                ),
                Spacing.vertSmall(),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.orderbookData?.asks.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = viewModel.orderbookData?.asks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              const Spacer(flex: 2),
                              Expanded(
                                flex: 5,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 20,
                                        width: constraints.maxWidth / 1.5,
                                        color: AppColors.green.withOpacity(.15),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacing.horizRegular(),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  data?.formattedPrice ?? '0',
                                  style: AppTextStyles.medium12.copyWith(
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  data?.quantity ?? '0',
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.medium12.copyWith(
                                    color: context.cScheme.onBackground,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  data?.total ?? '0',
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.medium12.copyWith(
                                    color: context.cScheme.onBackground,
                                  ),
                                ),
                              ),
                              Spacing.horizRegular(),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrangement(
    BuildContext context,
    HomeViewModel viewModel,
    String icon,
    int index,
  ) {
    final isActive = viewModel.arrangement == index;
    return InkWell(
      onTap: () => viewModel.setArrangement(index),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? context.cScheme.primaryContainer : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
