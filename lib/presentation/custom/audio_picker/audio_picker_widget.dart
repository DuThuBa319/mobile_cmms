import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';

import '../../../common/services/permission_service.dart';
import '../../base/base.dart';
import '../../base/state_base/bloc_status_state.dart';

import '../../theme/theme_color.dart';
import '../select_info_screen/bloc/receive_info_selection_bloc/receive_info_selection_bloc.dart';
import 'audio_picker_bloc/audio_picker_bloc.dart';

part 'audio_picker.action.dart';

class AudioListView extends StatefulWidget {
  AudioListView({super.key, this.bloc, this.receiveBloc});
  final AudioPickerBloc? bloc;
  final ReceiveInfoSelectionBloc? receiveBloc;
  @override
  State<AudioListView> createState() => _AudioListViewState();
}

class _AudioListViewState extends State<AudioListView> {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  Duration? audioDuration;
  List<AudioInfo> audioInfos = [];
  @override
  void initState() {
    initRecorder();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<AudioPickerBloc, AudioPickerState>(
          listener: _blocListener,
          builder: (context, state) {
            if (state is GetAudioState &&
                state.status == BlocStatusState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: audioInfos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    editPicker(context, index);
                  },
                  child: Container(
                    width: 378,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 15),
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.blue0089D7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.play_circle_filled,
                              color: AppColor.blue0089D7,
                              size: 27,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              audioInfos[index].name ?? '',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Text(
                          displayTime(
                            audioInfos[index].duration!,
                          ),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.blue0089D7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColor.blue0089D7,
              size: 25,
            ),
            onPressed: () {
              showPicker(context);
            },
          ),
        ),
      ],
    );
  }
}
