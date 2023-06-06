part of 'add_material_view.dart';

extension AddMaterialViewAction on _AddMaterialViewState {
  void _blocListener(BuildContext context, AddMaterialState state) {
    if (state.status == BlocStatusState.loading) {
      if (state is GetMaterialInfoCodeState) showToast('Đang tải dữ liệu');
      if (state is CreateMaterialState) showToast('Đang gửi dữ liệu');
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state.status == BlocStatusState.success) {
      if (state is CreateMaterialState) {
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Center(
            child: AlertDialog(
              title: const Text('Phản hồi'),
              content: Text(
                'Thành công thêm vật liệu',
                style: Theme.of(context).textTheme.caption,
              ),
              actions: [
                TextButton(
                  child: const Text('Thoát'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        if (state is ChangeStatusState) {
        } else {
          showToast('Đã tải dữ liệu thành công');
        }

        if (state is GetMaterialInfoCodeState) {
          materialInfoCodeSelection = <String>['<Chọn loại vật tư>'];
          materialInfoCodeSelection.addAll(state.viewModel.listCode ?? []);
        }

        Navigator.pop(context);
      }
    }
    if (state.status == BlocStatusState.failure) {
      if (state is CreateMaterialState) {
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => Center(
            child: AlertDialog(
              title: const Text('Phản hồi'),
              content: Text('Thêm vật tư không thành công',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.red)),
              actions: [
                TextButton(
                  child: const Text('Thực hiện lại'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        showToast('Tải dữ liệu không thành công');
        Navigator.pop(context);
      }
    }
  }

  void materialInfoCodeChanged(dynamic value) {
    bloc.add(GetMaterialInfoNameEvent(selectedCode: value));
  }

  void statusChanged(dynamic value) {
    MaterialStatus? materialStatus;
    if (value == 'Có sẵn') {
      materialStatus = MaterialStatus.available;
    }
    if (value == 'Bị lỗi') {
      materialStatus = MaterialStatus.error;
    }
    if (value == 'Hết hạn sử dụng') {
      materialStatus = MaterialStatus.expired;
    }
    if (value == 'Đang được sử dụng') {
      materialStatus = MaterialStatus.inUsed;
    }
    if (value == 'Bị thất lạc') {
      materialStatus = MaterialStatus.missing;
    }
    bloc.add(ChangeStatusEvent(selectedStatus: materialStatus));
  }
}
