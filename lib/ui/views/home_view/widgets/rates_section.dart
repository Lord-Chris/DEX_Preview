import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/_core.dart';
import '../../../shared/_shared.dart';
import '../home_viewmodel.dart';

class RatesSection extends ViewModelWidget<HomeViewModel> {
  const RatesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
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
          Container(
            height: 200,
            color: context.cScheme.background,
          ),
        ],
      ),
    );
  }
}
