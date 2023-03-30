import 'package:flutter/material.dart';

import '../../../../theme/theme_color.dart';
import 'replace_mold_screen.dart';

class PanelExpansion extends StatefulWidget {
  const PanelExpansion({super.key, this.expansionItem});
  final ExpansionItem? expansionItem;

  @override
  State<PanelExpansion> createState() => _PanelExpansionState();
}

class _PanelExpansionState extends State<PanelExpansion> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 12, bottom: 8),
        child: ListTileTheme(
          dense: true,
          child: ExpansionTile(
            backgroundColor: AppColor.greyF3,
            collapsedBackgroundColor: AppColor.greyF3,
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.expansionItem!.header,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14),
                ),
                Text(
                  widget.expansionItem!.itemID,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 14),
                )
              ],
            ),
            trailing: Icon(
              widget.expansionItem!.isExpand
                  ? Icons.expand_more
                  : Icons.expand_less,
              color: Colors.black,
            ),
            children: <Widget>[
              const Divider(color: AppColor.graybebebe),
              DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 10,
                      children: const [
                        Text('Tên khuôn:'),
                        Text('Tình trạng:'),
                        Text('Vệ sinh gần đây:'),
                        Text('Đánh bóng gần đây:'),
                        Text('Bảo trì:')
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(widget.expansionItem!.tenKhuon),
                        Text(widget.expansionItem!.tinhTrang),
                        Text(widget.expansionItem!.veSinh),
                        Text(widget.expansionItem!.danhBong),
                        Text(widget.expansionItem!.baoTri)
                      ],
                    ),
                  ],
                ),
              ),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => widget.expansionItem!.isExpand = expanded);
            },
          ),
        ),
      ),
    );
  }
}
