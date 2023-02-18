import 'package:flutter/material.dart';

import '../../../route/route_list.dart';
import '../../../theme/theme_color.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          color: const Color.fromARGB(255, 234, 234, 234),
          width: 396,
          height: 170,
        ),
        LineDivider(),
        Row(
          children: [
            BoxIcon(
              Icons.calendar_month,
              'Lịch sửa chữa',
              function: scheduleNavigator,
            ),
            BoxIcon(Icons.qr_code_scanner, 'Quét mã'),
            BoxIcon(Icons.dns, 'Kho phụ kiện'),
          ],
        ),
        LineDivider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 24, 0, 8),
          child: Text(
            'Gần đây',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 3, bottom: 20),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) =>
                  InfoCard(index == 0 ? Icons.build : Icons.invert_colors),
            ),
          ),
        )
      ],
    );
  }

  void scheduleNavigator() {
    setState(() {
      Navigator.pushNamed(context, RouteList.schedule);
    });
  }

  Card InfoCard(IconData icon) {
    final textStyle =
        Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12);
    return Card(
      shadowColor: Colors.transparent,
      color: AppColor.greyF3,
      margin: const EdgeInsets.fromLTRB(24, 5, 24, 5),
      child: ListTile(
        onTap: () {},
        horizontalTitleGap: 0, // khoang cach gia icon va tiltle
        dense: true,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: const EdgeInsets.fromLTRB(14, 3, 7, 2),
        leading: Icon(icon, color: Colors.black, size: 18),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'A012345',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  'Máy ép',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
                Text(
                  'M39',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(
          '14:23 3/2/2023',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                height: 2,
              ),
        ),
      ),
    );
  }

  Widget LineDivider() => const Divider(
        indent: 32,
        endIndent: 32,
        thickness: 1,
        color: Color.fromARGB(255, 220, 220, 220),
      );

  Widget BoxIcon(IconData icon, String text, {Function()? function}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(23, 20, 10, 20),
      child: Column(
        children: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 8, right: 5),
            onPressed: function ?? () {},
            icon: Icon(
              icon,
              size: 35,
            ),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
