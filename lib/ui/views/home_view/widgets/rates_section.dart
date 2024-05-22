import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                return const ChartSection();
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartSection extends ViewModelWidget<HomeViewModel> {
  const ChartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              Center(
                child: Text(
                  'Time',
                  style: AppTextStyles.medium14.copyWith(
                    color: context.cScheme.onSecondary,
                  ),
                ),
              ),
              Spacing.horizRegular(),
              ...ChartIntervalEnum.values.map(
                (filter) => GestureDetector(
                  onTap: () => viewModel.setInterval(filter),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: viewModel.interval == filter
                          ? context.cScheme.secondary
                          : context.cScheme.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      filter.name,
                      style: AppTextStyles.medium14.copyWith(
                        color: viewModel.interval == filter
                            ? context.cScheme.onBackground
                            : context.cScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ),
              Spacing.horizTiny(),
              const VerticalDivider(),
              Spacing.horizTiny(),
              SvgPicture.asset(AppSvgAssets.candleChart),
              Spacing.horizTiny(),
              const VerticalDivider(),
              Center(
                child: Text(
                  'Fx Indicators',
                  style: AppTextStyles.medium14.copyWith(
                    color: context.cScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1, color: context.cScheme.secondary),
        Spacing.vertRegular(),
        Expanded(
          child: Candlesticks(
            candles: viewModel.candles.map((e) => e.toCandle()).toList(),
          ),
        ),
      ],
    );
  }
}
