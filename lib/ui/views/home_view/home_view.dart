import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../shared/_shared.dart';
import 'home_viewmodel.dart';
import 'widgets/orders_section.dart';
import 'widgets/rates_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 137,
            leading: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                AppSvgAssets.companyLogo(context.cScheme.brightness.name),
                width: 121,
              ),
            ),
            actions: [
              IconButton(
                icon: Image.asset(AppImgAssets.profileImage, scale: 2),
                onPressed: () {},
              ),
              Spacing.horizTiny(),
              IconButton(
                icon: SvgPicture.asset(AppSvgAssets.globe),
                onPressed: () {},
              ),
              Spacing.horizTiny(),
              IconButton(
                icon: SvgPicture.asset(AppSvgAssets.menu),
                onPressed: () {},
              ),
              Spacing.horizRegular(),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              Container(
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
                          viewModel.exchange,
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
                    SizedBox(
                      height: 48,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          ExchangeDetail(
                            icon: Icons.access_time,
                            title: '24h Change',
                            value: '520.80 +1.25%',
                            color: AppColors.green,
                          ),
                          VerticalDivider(),
                          ExchangeDetail(
                            icon: CupertinoIcons.up_arrow,
                            title: '24h high',
                            value: '520.80 +1.25%',
                          ),
                          VerticalDivider(),
                          ExchangeDetail(
                            icon: CupertinoIcons.down_arrow,
                            title: '24h low',
                            value: '520.80 +1.25%',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.vertSmall(),
              const RatesSection(),
              Spacing.vertSmall(),
              const OrdersSection(),
              Spacing.vertLarge(),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Buy',
                        onPressed: viewModel.openCreateOrderSheet,
                        buttonColor: AppColors.green,
                        labelColor: AppColors.white,
                      ),
                    ),
                    Spacing.horizRegular(),
                    Expanded(
                      child: AppButton(
                        label: 'Sell',
                        onPressed: () {},
                        buttonColor: AppColors.red,
                        labelColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.vertLarge(),
            ],
          ),
        );
      },
    );
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
