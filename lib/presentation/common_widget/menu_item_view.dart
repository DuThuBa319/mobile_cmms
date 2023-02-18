import 'package:flutter/material.dart';

import '../theme/theme_color.dart';
import 'item_devider.dart';

class MenuItemView extends StatelessWidget {
  final String title;
  final double? titleSize;
  final Function()? onTap;
  final Widget icon;
  final Color? color;
  final ItemDivider? divider;
  final EdgeInsets padding;
  final Widget? tailIcon;
  final double? chevronSize;
  final bool showChevronIcon;

  const MenuItemView({
    Key? key,
    required this.title,
    this.titleSize,
    required this.icon,
    this.onTap,
    this.color,
    this.divider,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.tailIcon,
    this.chevronSize,
    this.showChevronIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom:
            divider == ItemDivider.none || divider == ItemDivider.line ? 0 : 16,
      ),
      child: Material(
        color: color ?? Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(left: padding.left, right: padding.right),
            child: Container(
              padding:
                  EdgeInsets.only(top: padding.top, bottom: padding.bottom),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: divider == ItemDivider.line
                    ? const Border(
                        bottom: BorderSide(
                          color: AppColor.lightGrey,
                          width: 1,
                        ),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  icon,
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Colors.black,
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (tailIcon != null) tailIcon!,
                  if (onTap != null &&
                      tailIcon == null &&
                      showChevronIcon == true)
                    Icon(
                      Icons.chevron_right_outlined,
                      size: chevronSize ?? 12,
                      color: Colors.grey,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
