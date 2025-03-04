import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import '../../../generated/assets.dart';
import '../../theme/theme_color.dart';
import '../export.dart';

class ScreenForm extends StatefulWidget {
  final String? title;
  final String? des;
  final Widget? child;
  final Color? bgColor;
  final Color? headerColor;
  final Color? textColor;
  final Color? backColor;
  final bool showHeaderImage;
  final List<Widget> actions;
  final void Function()? onBack;
  final bool? resizeToAvoidBottomInset;
  final Widget? extentions;
  final bool showBackButton;
  final double? backgroundHeight;

  const ScreenForm({
    Key? key,
    this.title,
    this.des,
    this.child,
    this.bgColor,
    this.textColor,
    this.backColor,
    this.showHeaderImage = true,
    this.actions = const <Widget>[],
    this.headerColor,
    this.onBack,
    this.resizeToAvoidBottomInset,
    this.extentions,
    this.showBackButton = true,
    this.backgroundHeight,
  }) : super(key: key);

  @override
  _ScreenFormState createState() => _ScreenFormState();
}

class _ScreenFormState extends State<ScreenForm> with AfterLayoutMixin {
  late ThemeData _theme;
  late final showBackButton =
      widget.showBackButton && Navigator.of(context).canPop();

  @override
  void afterFirstLayout(BuildContext context) {
    if (widget.showHeaderImage) {
      AppColor.setDarkStatusBar();
    } else {
      AppColor.setLightStatusBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    final padding = mediaQueryData.padding;

    final main = Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: padding.top + 16),
          color: widget.headerColor ?? Colors.transparent,
          child: _buildAppBar(),
        ),
        Expanded(
          child: widget.child ?? const SizedBox(),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: widget.bgColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: GestureDetector(
        onTap: () => CommonFunction.hideKeyBoard(context),
        child: widget.showHeaderImage == true
            ? Stack(
                children: [
                  Image.asset(
                    Assets.bgHeader,
                    fit: widget.backgroundHeight != null
                        ? BoxFit.fitHeight
                        : BoxFit.cover,
                    width: mediaQueryData.size.width,
                    height: widget.backgroundHeight,
                  ),
                  main,
                ],
              )
            : main,
      ),
    );
  }

  Widget _buildAppBar() {
    final textColor = widget.textColor ??
        (widget.showHeaderImage == true ? Colors.white : Colors.black);

    final desTextColor = widget.textColor ??
        (widget.showHeaderImage == true ? Colors.white.withOpacity(0.7) : null);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: showBackButton ? 4 : 16),
            if (showBackButton)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: IconButton(
                  onPressed: widget.onBack ?? () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left_outlined,
                    size: 24,
                    color: widget.backColor ?? Colors.white,
                  ),
                ),
              ),
            const SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: widget.actions.isEmpty ? 24 : 8,
                  top: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      widget.title ?? '',
                      style: _theme.textTheme.displaySmall?.copyWith(
                        color: textColor,
                        fontSize: 24,
                      ),
                    ),
                    if (widget.des?.isNotEmpty == true)
                      const SizedBox(height: 4),
                    if (widget.des?.isNotEmpty == true)
                      Text(
                        widget.des ?? '',
                        style: _theme.textTheme.titleSmall?.copyWith(
                          color: desTextColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ...widget.actions,
          ],
        ),
        if (widget.extentions != null) widget.extentions!,
        const SizedBox(height: 16),
      ],
    );
  }
}
