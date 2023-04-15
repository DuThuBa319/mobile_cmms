import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../custom/custom_screen_form.dart';
import '../../maintenance_request/bloc/audio_picker_bloc/audio_picker_bloc.dart';
import '../../maintenance_request/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'report_review_view.dart';

class ReportReviewScreen extends StatefulWidget {
  ReportReviewScreen({super.key, required this.title});
  String title;
  @override
  State<ReportReviewScreen> createState() => _ReportReviewScreenState();
}

class _ReportReviewScreenState extends State<ReportReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScreenForm(
      title: widget.title,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ImagePickerBloc>(
            create: (context) => ImagePickerBloc(),
          ),
          BlocProvider<AudioPickerBloc>(
            create: (context) => AudioPickerBloc(),
          )
        ],
        child: const ReportReviewView(),
      ),
    );
  }
}
