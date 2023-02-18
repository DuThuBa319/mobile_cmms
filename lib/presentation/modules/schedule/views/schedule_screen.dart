import 'package:flutter/material.dart';

import '../../../custom/custom_screen_form.dart';
import 'schedule_view.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScreenForm(child: ScheduleView());
  }
}
