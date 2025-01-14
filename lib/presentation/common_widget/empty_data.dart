import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final Function()? onTap;

  const EmptyData({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty_rounded,
              size: MediaQuery.of(context).size.width / 3,
            ),
            const SizedBox(height: 8),
            Text(
              'Không có dữ liệu',
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
