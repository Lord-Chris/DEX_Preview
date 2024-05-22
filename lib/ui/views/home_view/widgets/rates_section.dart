import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';
import '../home_viewmodel.dart';
import 'orderbook_section.dart';

class RatesSection extends ViewModelWidget<HomeViewModel> {
  const RatesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      height: 400,
      color: context.cScheme.background,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.cScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 45,
            child: Row(
              children: MainViewEnum.values
                  .map((filter) => Expanded(
                        child: SectionItem(
                          label: filter.value,
                          isActive: viewModel.mainView == filter,
                          onTap: () => viewModel.setMainView(filter),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Spacing.vertRegular(),
          Expanded(
            child: Container(
              height: 400,
              width: context.screenSize.width,
              color: context.cScheme.background,
              child: Builder(builder: (context) {
                if (viewModel.mainView == MainViewEnum.orderbook) {
                  return const OrderbookSection();
                }
                return Candlesticks(
                  candles: viewModel.candles.map((e) => e.toCandle()).toList(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
