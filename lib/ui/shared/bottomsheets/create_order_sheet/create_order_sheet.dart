import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../../core/app/_app.dart';
import '../../_shared.dart';
import 'create_order_sheet_viewmodel.dart';

class CreateOrderSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  const CreateOrderSheet({
    super.key,
    this.request,
    this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateOrderSheetViewModel>.reactive(
      viewModelBuilder: () => CreateOrderSheetViewModel(),
      builder: (context, viewModel, child) {
        return BottomSheet(
          onClosing: () {},
          enableDrag: false,
          constraints: BoxConstraints.loose(
            Size.fromHeight(context.screenSize.height * 0.95),
          ),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(30, 28, 30, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.cScheme.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 45,
                    child: Row(
                      children: ['Buy', 'Sell']
                          .map((filter) => Expanded(
                                child: SectionItem(
                                  label: filter,
                                  activeBorderColor: AppColors.green,
                                  isActive: viewModel.orderType == filter,
                                  onTap: () => viewModel.setOrdertype(filter),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Spacing.vertRegular(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: ['Limit', 'Market', 'Stop-Limit'].map(
                        (filter) {
                          final isActive = viewModel.type == filter;
                          return InkWell(
                            onTap: () => viewModel.setType(filter),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    isActive ? context.cScheme.secondary : null,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                filter,
                                style: AppTextStyles.medium14.copyWith(
                                  color: isActive
                                      ? context.cScheme.onBackground
                                      : context.cScheme.onSecondary,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Spacing.vertRegular(),
                  AppTextField(
                    textAlign: TextAlign.end,
                    hint: '0.00 USD',
                    prefix: Text(
                      'Limit price',
                      style: AppTextStyles.medium12.copyWith(
                        color: context.cScheme.onSecondary,
                      ),
                    ),
                  ),
                  Spacing.vertRegular(),
                  AppTextField(
                    textAlign: TextAlign.end,
                    hint: '0.00 USD',
                    prefix: Text(
                      'Amount',
                      style: AppTextStyles.medium12.copyWith(
                        color: context.cScheme.onSecondary,
                      ),
                    ),
                  ),
                  Spacing.vertRegular(),
                  AppDropdownField<String>(
                    items: const ['Good till cancelled'],
                    value: 'Good till cancelled',
                    hint: '0.00 USD',
                    prefix: Text(
                      'Type',
                      style: AppTextStyles.medium12.copyWith(
                        color: context.cScheme.onSecondary,
                      ),
                    ),
                  ),
                  Spacing.vertSmall(),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (val) {},
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return context.cScheme.secondary;
                          }
                          return AppColors.transparent;
                        }),
                      ),
                      Text(
                        'Post Only',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Spacing.horizTiny(),
                      const Icon(Icons.info_outline, size: 12),
                    ],
                  ),
                  Spacing.vertSmall(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Text(
                        '0.00 USD',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  Spacing.vertRegular(),
                  Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.gradientPurple,
                          AppColors.gradientViolet,
                          AppColors.gradentRed,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Buy BTC',
                        style: AppTextStyles.bold14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Spacing.vertSmall(),
                  const Divider(),
                  Spacing.vertSmall(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total account value',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'NGN',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp,
                          color: context.cScheme.onSecondary, size: 16),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '0.00',
                      style: AppTextStyles.bold14.copyWith(
                        color: context.cScheme.onBackground,
                      ),
                    ),
                  ),
                  Spacing.vertMedium(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Open Orders',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Text(
                        'Available',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0.00',
                        style: AppTextStyles.bold14.copyWith(
                          color: context.cScheme.onBackground,
                        ),
                      ),
                      Text(
                        '0.00',
                        style: AppTextStyles.bold14.copyWith(
                          color: context.cScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Spacing.vertExtraMedium(),
                  AppButton(
                    label: 'Deposit',
                    buttonColor: AppColors.blue,
                    onPressed: () {},
                    isCollapsed: true,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
