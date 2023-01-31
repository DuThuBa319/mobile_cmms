import 'package:flutter/material.dart';

part 'dropdown_controller.dart';

class DropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final T? defaultItem;
  final Function(T?)? onChanged;
  final String? hint;
  final Widget Function(T) itemBuilder;
  final DropdownController<T, DropdownData<T>> controller;
  final Color? borderColor;

  DropdownWidget({
    required this.controller,
    required this.itemBuilder,
    required this.items,
    this.onChanged,
    this.hint,
    this.defaultItem,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    if (defaultItem != null && items.contains(defaultItem)) {
      controller.setData(defaultItem);
    }

    return ValueListenableBuilder<DropdownData<T>>(
      valueListenable: controller,
      builder: (ctx, value, w) {
        return DropdownButtonFormField<T>(
          value: value.value,
          items: items.map((e) {
            return DropdownMenuItem<T>(
              value: e,
              child: itemBuilder(e),
            );
          }).toList(),
          onChanged: (value) {
            controller.setData(value);
            onChanged?.call(value);
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 16,
          ),
          iconSize: 16,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: themeData.textTheme.subtitle2,
            errorText: value.validation,
            errorStyle: themeData.textTheme.subtitle1?.copyWith(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
