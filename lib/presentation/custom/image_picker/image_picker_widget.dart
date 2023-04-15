import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../base/state_base/bloc_status_state.dart';
import '../../modules/maintenance_request/bloc/image_picker_bloc/image_picker_bloc.dart';
import '../../theme/theme_color.dart';

part 'image_picker.action.dart';

class ImagePickerGridView extends StatefulWidget {
  ImagePickerGridView({super.key, this.bloc});
  ImagePickerBloc? bloc;

  @override
  State<ImagePickerGridView> createState() => _ImagePickerGridViewState();
}

class _ImagePickerGridViewState extends State<ImagePickerGridView> {
  int imageCount = 0;
  List<File> imageFiles = [];
  double height = 105;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, state) {
        if (state is GetImageState && state.status == BlocStatusState.success) {
          imageCount = state.viewModel.imageFiles?.length ?? 0;
          imageFiles = state.viewModel.imageFiles!;
          height = (imageCount ~/ 4 + 1) * 105;
        }

        return Container(
          padding: const EdgeInsets.only(right: 40, top: 10),
          width: MediaQuery.of(context).size.width,
          height: height,
          child: GridView.count(
            padding: EdgeInsets.zero,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: List.generate(
              imageCount + 1,
              (index) => DottedBorder(
                color: AppColor.blue0089D7,
                strokeWidth: 1.5,
                dashPattern: const [
                  2,
                  2,
                ],
                radius: const Radius.circular(4),
                child: GestureDetector(
                  onTap: () {
                    index == imageCount
                        ? showPicker(context)
                        : editPicker(context, index);
                  },
                  child: index == imageCount
                      ? state.status == BlocStatusState.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              width: 84,
                              height: 84,
                              child: const Icon(
                                Icons.add,
                                color: AppColor.blue0089D7,
                                size: 40,
                              ),
                            )
                      : Image.file(
                          state.viewModel.imageFiles![index],
                          width: 84,
                          height: 84,
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
