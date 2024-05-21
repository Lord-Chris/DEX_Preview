import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/_core.dart';
import '../../_shared.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final InputBorder? border;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? bottomRightWidget;
  final bool readOnly;
  final bool expands;
  final bool hasBorder;
  final int? minLines, maxLines, maxLength;
  final bool enabled;
  final Color? fillColor;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.border,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.expands = false,
    this.hasBorder = true,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor,
    this.onTap,
    this.onEditingComplete,
    this.decoration,
    this.textAlign,
    this.textAlignVertical,
    this.bottomRightWidget,
    this.inputFormatters,
    this.contentPadding,
  }) : assert(initialValue == null || controller == null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.tTheme.titleMedium,
          ),
          Spacing.vertExtraTiny(),
          Spacing.vertTiny(),
        ],
        Flexible(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            initialValue: initialValue,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            keyboardType: keyboardType,
            cursorWidth: 1,
            textCapitalization: textCapitalization,
            obscureText: obscureText,
            obscuringCharacter: '●',
            readOnly: readOnly,
            focusNode: focusNode,
            expands: expands,
            maxLines: maxLines,
            validator: validator,
            minLines: minLines,
            // maxLength: maxLength,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
              ...inputFormatters ?? []
            ],
            textAlignVertical: textAlignVertical ?? TextAlignVertical.bottom,
            textAlign: textAlign ?? TextAlign.start,
            onEditingComplete:
                onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
            style: AppTextStyles.medium12,
            decoration: decoration ??
                InputDecoration(
                  hintText: hint,
                  contentPadding: contentPadding,
                  suffixIcon: suffix,
                  prefixIcon: (prefix != null)
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  prefix!,
                                  Spacing.horizTiny(),
                                  const Icon(Icons.info_outline, size: 12),
                                ],
                              ),
                            ),
                          ],
                        )
                      : null,
                  enabled: enabled,
                  border: border,
                ),
          ),
        ),
      ],
    );
  }
}

class AppDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget Function(T)? customItem;
  final String Function(T)? displayItem;
  final String? label, hint;
  final String? headingText;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final bool hasBorder;

  const AppDropdownField({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.headingText,
    this.prefix,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.displayItem,
    this.hasBorder = true,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            // style: AppTextStyles.medium14.copyWith(
            //     // color: AppColors.black,
            //     ),
          ),
        if (label != null) Spacing.vertExtraTiny(),
        if (label != null) Spacing.vertTiny(),
        DropdownButtonFormField<T>(
          items: items.map(
            (T item) {
              if (customItem != null) {
                return DropdownMenuItem(
                  value: item,
                  child: customItem!(item),
                );
              }
              return DropdownMenuItem(
                value: item,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    displayItem != null ? displayItem!(item) : item.toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.medium12.copyWith(
                      height: 1,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          isExpanded: true,
          onChanged: onChanged,
          validator: validator,
          value: value,
          focusNode: focusNode,
          icon: const Icon(Icons.keyboard_arrow_down, size: 0),
          style: AppTextStyles.medium12,
          alignment: Alignment.centerRight,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.medium12,
            prefixIcon: (prefix != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            prefix!,
                            Spacing.horizTiny(),
                            const Icon(Icons.info_outline, size: 12),
                          ],
                        ),
                      ),
                    ],
                  )
                : null,
            enabled: enabled,
          ),
        ),
      ],
    );
  }
}
