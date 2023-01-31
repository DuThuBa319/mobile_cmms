import 'package:flutter/material.dart';

class InfoVertical extends StatelessWidget {
  final String? title;
  final String? value;
  final Color color;
  final Color? valueColor;
  final EdgeInsets padding;
  final Widget? myOwnValueWidget;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double? width;
  final Widget? image;
  final double? imageSize;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final bool? hasEndSeparation;
  final double? indent;
  final int? valueMaximumLines;
  final bool isShowTrailingAmount;
  final String? trailingAmount;

  const InfoVertical({
    Key? key,
    this.title,
    this.value,
    this.color = Colors.white,
    this.valueColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.myOwnValueWidget,
    this.crossAxisAlignment,
    this.height,
    this.image,
    this.imageSize,
    this.titleStyle,
    this.valueStyle,
    this.hasEndSeparation = false,
    this.indent,
    this.valueMaximumLines = 4,
    this.isShowTrailingAmount = false,
    this.width,
    this.trailingAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Container(
      color: color,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: image != null ? imageSize : 0,
                    height: height,
                    child: image != null ? image! : null,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? '',
                          style: titleStyle,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          child: Text(
                            value ?? '',
                            style: valueStyle,
                            maxLines: valueMaximumLines,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  isShowTrailingAmount
                      ? Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            trailingAmount ?? '--',
                            textAlign: TextAlign.center,
                            style: _themeData.textTheme.subtitle2,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            hasEndSeparation!
                ? Divider(
                    indent: indent,
                    endIndent: indent,
                    color: const Color(0xFFACACAC),
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  )
          ],
        ),
      ),
    );
  }
}
