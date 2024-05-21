import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';
import '../home_viewmodel.dart';

class TickerSection extends ViewModelWidget<HomeViewModel> {
  const TickerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return HookBuilder(builder: (context) {
      final tickerData = useListenable(viewModel.tickerData).value;
      return Container(
        color: context.cScheme.background,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Spacing.horizRegular(),
                SvgPicture.asset(AppSvgAssets.btcUsdt, height: 24),
                Spacing.horizSmall(),
                Text(
                  viewModel.symbol,
                  style: AppTextStyles.medium18.copyWith(
                    color: context.cScheme.onBackground,
                  ),
                ),
                Spacing.horizSmall(),
                const Icon(CupertinoIcons.chevron_down, size: 14),
                Spacing.horizLarge(),
                Text(
                  r'$20,634',
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
            Spacing.vertRegular(),
            if (tickerData != null)
              SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ExchangeDetail(
                      icon: Icons.access_time,
                      title: '24h Change',
                      value:
                          '${tickerData.priceChange} ${tickerData.priceChangePercent}%',
                      color: tickerData.priceChangePercent.isNegative
                          ? AppColors.red
                          : AppColors.green,
                    ),
                    const VerticalDivider(),
                    ExchangeDetail(
                      icon: CupertinoIcons.up_arrow,
                      title: '24h high',
                      value: '${tickerData.highestPrice} +1.25%',
                    ),
                    const VerticalDivider(),
                    ExchangeDetail(
                      icon: CupertinoIcons.down_arrow,
                      title: '24h low',
                      value: '${tickerData.lowestPrice} -1.25%',
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}

class ExchangeDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? color;
  const ExchangeDetail({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacing.horizRegular(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: context.cScheme.onSecondary,
                  size: 16,
                ),
                Spacing.horizTiny(),
                Text(
                  title,
                  style: AppTextStyles.medium12.copyWith(
                    color: context.cScheme.onSecondary,
                  ),
                ),
              ],
            ),
            Spacing.vertTiny(),
            Text(
              value,
              maxLines: 1,
              style: AppTextStyles.medium14.copyWith(
                color: color ?? context.cScheme.onBackground,
              ),
            ),
          ],
        ),
        Spacing.horizRegular(),
      ],
    );
  }
}
