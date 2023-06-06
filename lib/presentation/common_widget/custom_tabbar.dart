import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../theme/theme_color.dart';

class CustomTabbar extends StatefulWidget {
  final List<String> titles;
  final List<GlobalKey>? keys;
  final int selectedIdx;
  final Future<bool> Function(int)? onTap;
  final Color? color;
  final BoxDecoration? parentDecoration;
  final BoxDecoration? childDecoration;
  final BoxDecoration? childSelectedDecoration;
  final TextStyle? childTextStyle;
  final TextStyle? childSelectedTextStyle;
  final EdgeInsetsGeometry? childPadding;
  final EdgeInsetsGeometry? childMargin;
  final bool? isScrollable;

  const CustomTabbar({
    Key? key,
    required this.titles,
    this.selectedIdx = 0,
    this.onTap,
    this.color,
    this.keys,
    this.parentDecoration,
    this.childDecoration,
    this.childPadding,
    this.childSelectedDecoration,
    this.childTextStyle,
    this.childSelectedTextStyle,
    this.childMargin,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  _CustomTabbarState createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  late ValueNotifier<int> _valueNotifier;

  @override
  void initState() {
    _valueNotifier = ValueNotifier(widget.selectedIdx);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _valueNotifier.value = widget.selectedIdx;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomTabbar oldWidget) {
    if (oldWidget.selectedIdx != widget.selectedIdx) {
      _valueNotifier.value = widget.selectedIdx;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.parentDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.color ?? Colors.white,
          ),
      child: ValueListenableBuilder(
        valueListenable: _valueNotifier,
        builder: (context, value, w) {
          return widget.isScrollable == true
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.titles
                        .mapIndex<Widget>(
                          (title, idx) => TabItem(
                            key: widget.keys?[idx],
                            onTap: () async {
                              if (idx != value) {
                                await widget.onTap?.call(idx);
                                _valueNotifier.value = idx;
                              }
                            },
                            selected: idx == value,
                            title: title,
                            decoration: widget.childDecoration,
                            selectedDecoration: widget.childSelectedDecoration,
                            textStyle: widget.childTextStyle,
                            selectedTextStyle: widget.childSelectedTextStyle,
                            margin: widget.childMargin,
                            padding: widget.childPadding,
                          ),
                        )
                        .toList(),
                  ),
                )
              : Row(
                  children: widget.titles
                      .mapIndex<Widget>(
                        (title, idx) => Expanded(
                          child: TabItem(
                            key: widget.keys?[idx],
                            onTap: () async {
                              if (idx != value) {
                                await widget.onTap?.call(idx);
                                _valueNotifier.value = idx;
                              }
                            },
                            selected: idx == value,
                            title: title,
                            decoration: widget.childDecoration,
                            selectedDecoration: widget.childSelectedDecoration,
                            textStyle: widget.childTextStyle,
                            selectedTextStyle: widget.childSelectedTextStyle,
                            margin: widget.childMargin,
                            padding: widget.childPadding,
                          ),
                        ),
                      )
                      .toList(),
                );
        },
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onTap;
  final BoxDecoration? decoration;
  final BoxDecoration? selectedDecoration;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const TabItem({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
    this.decoration,
    this.selectedDecoration,
    this.textStyle,
    this.selectedTextStyle,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const duration = Duration(milliseconds: 250);
    return InkWell(
      onTap: onTap.call,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      splashColor: Colors.white38,
      child: Container(
        decoration: selected
            ? selectedDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selected ? AppColor.primaryColor : Colors.transparent,
                )
            : decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selected ? AppColor.primaryColor : Colors.transparent,
                ),
        margin: margin,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: duration,
            style: selected
                ? selectedTextStyle ??
                    themeData.textTheme.bodyLarge!.copyWith(
                      color: AppColor.subText,
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal,
                    )
                : textStyle ??
                    themeData.textTheme.bodyLarge!.copyWith(
                      color: selected ? Colors.white : AppColor.subText,
                      fontWeight:
                          selected ? FontWeight.bold : FontWeight.normal,
                    ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
