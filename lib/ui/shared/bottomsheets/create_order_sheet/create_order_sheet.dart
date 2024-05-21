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
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
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
                    margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  const AppTextField(
                    textAlign: TextAlign.end,
                    hint: '0.00 USD',
                    contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    prefix: Row(
                      children: [
                        Text(
                          'Limit price',
                          style: AppTextStyles.medium12,
                        ),
                        Icon(Icons.info_outline, size: 12),
                      ],
                    ),
                  ),
                  const AppTextField(
                    textAlign: TextAlign.end,
                    hint: '0.00 USD',
                    contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    prefix: Row(
                      children: [
                        Text(
                          'Limit price',
                          style: AppTextStyles.medium12,
                        ),
                        Icon(Icons.info_outline, size: 12),
                      ],
                    ),
                  ),
                  const AppTextField(
                    textAlign: TextAlign.end,
                    hint: '0.00 USD',
                    contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    prefix: Row(
                      children: [
                        Text(
                          'Limit price',
                          style: AppTextStyles.medium12,
                        ),
                        Icon(Icons.info_outline, size: 12),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                      ),
                      Text(
                        'Post Only',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      const Icon(Icons.info_outline, size: 12),
                    ],
                  ),
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
                  Spacing.vertMedium(),
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
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total account value',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Text(
                        'NGN',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '0.00',
                      style: AppTextStyles.medium12.copyWith(
                        color: context.cScheme.onSecondary,
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
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                      Text(
                        '0.00',
                        style: AppTextStyles.medium12.copyWith(
                          color: context.cScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
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
