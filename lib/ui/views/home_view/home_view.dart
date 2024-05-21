import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../shared/_shared.dart';
import 'home_viewmodel.dart';
import 'widgets/orders_section.dart';
import 'widgets/pop_menu.dart';
import 'widgets/rates_section.dart';
import 'widgets/ticker_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OverlayPortalController();
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
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
                icon: OverlayPortal(
                  controller: controller,
                  overlayChildBuilder: (context) =>
                      PopMenu(controller: controller),
                  child: SvgPicture.asset(AppSvgAssets.menu),
                ),
                onPressed: () => controller.toggle(),
              ),
              Spacing.horizRegular(),
            ],
          ),
          body: Builder(builder: (context) {
            if (viewModel.isBusy) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                const TickerSection(),
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
            );
          }),
        );
      },
    );
  }
}
