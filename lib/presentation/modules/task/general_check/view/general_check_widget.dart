import 'package:flutter/material.dart';
import '../../../../common_widget/dropdown/dropdown_widget.dart';
import '../../../../theme/theme_color.dart';
import '../../report/report_review_screen.dart';
import 'general_check_screen.dart';

class RowTile extends StatefulWidget {
  RowTile({super.key, this.isSeparate, this.title});
  bool? isSeparate = false;
  String? title = 'KIỂM TRA ĐIỆN';
  @override
  State<RowTile> createState() => _RowTileState();
}

class _RowTileState extends State<RowTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isSeparate == true
            ? const SizedBox(height: 20)
            : const SizedBox(),
        widget.isSeparate == true
            ? const Divider(
                thickness: 1,
                color: Colors.black,
                indent: 20,
                endIndent: 35,
              )
            : const SizedBox(),
        widget.isSeparate == true
            ? const SizedBox(height: 15)
            : const SizedBox(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          padding: const EdgeInsets.only(
            left: 6,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                child: Text(
                  widget.title!,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: AppColor.gray767676),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CheckDropDown extends StatefulWidget {
  CheckDropDown({
    super.key,
    required this.index,
  });
  int index;
  @override
  State<CheckDropDown> createState() => _CheckDropDownState();
}

class _CheckDropDownState extends State<CheckDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.only(
        left: 6,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 17,
            child: Text(listWork.keys.elementAt(widget.index)),
          ),
          Positioned(
            right: 50,
            top: 0,
            child: Container(
              width: 163,
              height: 60,
              child: DropdownWidget<String>(
                controller: taskDropdownControllers[widget.index],
                itemBuilder: itemBuilder,
                borderColor: AppColor.gray767676,
                items: result,
                iconData: Icons.keyboard_arrow_down,
                onChanged: (e) {
                  setState(() {
                    listWork[listWork.keys.elementAt(widget.index)] = e!;
                  });
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 5,
            child: listWork.values.elementAt(widget.index) == 'Không đạt'
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportReviewScreen(
                            title: listWork.keys.elementAt(widget.index),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.description,
                      color: AppColor.blue0089D7,
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }

  Widget itemBuilder(String item) {
    return Container(
      width: 120,
      height: 25,
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        item,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
