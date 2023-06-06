// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart' as ip;
import 'package:image_picker/image_picker.dart';
import 'package:pedantic/pedantic.dart';
import 'package:uuid/uuid.dart';

import '../../common/services/firebase/firebase_storage_service.dart';
import '../../common/services/permission_service.dart';
import '../../common/utils.dart';
import '../../common/utils/singletons.dart';
import '../extentions/extention.dart';
import '../theme/theme_color.dart';
import 'export.dart';

enum ImagePickerMode {
  video,
  photo,
  photoAndVideo,
  viewOnly,
}

class ImagePicked extends Equatable {
  final Key? key;
  final File? imageFile;
  final String? url;
  final String? mimetype;
  final bool isLoading;
  final ImagePickerMode mode;

  ImagePicked({
    required this.key,
    this.imageFile,
    this.url,
    this.mode = ImagePickerMode.photo,
    this.mimetype,
    this.isLoading = false,
  });

  ImagePicked copyWith({
    Key? key,
    File? imageFile,
    String? url,
    ImagePickerMode? mode,
    bool? isLoading,
    String? mimetype,
  }) {
    return ImagePicked(
      key: key ?? this.key,
      imageFile: imageFile ?? this.imageFile,
      url: url ?? this.url,
      mode: mode ?? this.mode,
      isLoading: isLoading ?? this.isLoading,
      mimetype: mimetype ?? this.mimetype,
    );
  }

  @override
  List<Object?> get props => [
        key,
        imageFile,
        url,
        mode,
        mimetype,
        isLoading,
      ];
}

class ImagePickerWidget extends StatefulWidget {
  final ImagePicked imagePicked;
  final void Function(ImagePicked?)? onImageUploadSucceed;
  final void Function(ImagePicked?)? onImageUploadFailed;
  final void Function(ImagePicked)? onImagePicked;
  final void Function(ImagePicked?)? onRemove;
  final void Function(ImagePicked?)? onTap;
  final String? uploadFolder;
  final List<ip.ImageSource> sources;
  final String? title;
  final String? message;
  final bool? canBeDelete;
  final bool? isError;

  const ImagePickerWidget({
    Key? key,
    required this.imagePicked,
    this.onImageUploadSucceed,
    this.onImageUploadFailed,
    this.onRemove,
    this.onTap,
    this.onImagePicked,
    this.uploadFolder,
    this.sources = ip.ImageSource.values,
    this.title,
    this.message,
    this.canBeDelete = true,
    this.isError = false,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  ImagePicked? _image;

  late AppLocalizations localization;

  final picker = ip.ImagePicker();

  @override
  void initState() {
    _image = widget.imagePicked;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ImagePickerWidget oldWidget) {
    _image = widget.imagePicked;
    super.didUpdateWidget(oldWidget);
  }

  double get borderRadius => 4;

  @override
  Widget build(BuildContext context) {
    localization = translate(context);
    if (_image == null ||
        (_image!.imageFile == null && _image!.url?.isNotEmpty != true)) {
      return _buildEmptyState();
    }

    logger.d('get image', _image!.url);
    return _buildImage(_image, _image!.isLoading == true);
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.only(top: 6, right: 6),
      child: Material(
        color:
            widget.isError == true ? AppColor.lightRed : AppColor.colorEDF4FF,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: _showImagePickerActionDialog,
          borderRadius: BorderRadius.circular(borderRadius),
          child: DottedBorder(
            color: widget.isError == true ? AppColor.red : AppColor.color97C1FF,
            strokeWidth: 1,
            dashPattern: const [5, 3],
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Align(
              child: Icon(
                Icons.add,
                size: 24,
                color: widget.isError == true
                    ? AppColor.red
                    : AppColor.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(ImagePicked? image, bool isLoading) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: widget.onTap != null ? () => widget.onTap!(image) : null,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: SizedBox(
                    width: constraints.maxWidth - 6,
                    height: constraints.maxHeight - 6,
                    child: Stack(
                      children: [
                        Hero(
                          tag: image!.key.toString(),
                          child: image.imageFile != null
                              ? Image.file(
                                  image.imageFile!,
                                  fit: BoxFit.cover,
                                  width: constraints.maxWidth - 6,
                                  height: constraints.maxHeight - 6,
                                )
                              : image.url?.isNotEmpty == true
                                  ? CachedNetworkImageWrapper.item(
                                      url: image.url ?? '',
                                      fit: BoxFit.cover,
                                      width: constraints.maxWidth - 6,
                                      height: constraints.maxHeight - 6,
                                    )
                                  : const SizedBox(),
                        ),
                        if (isLoading)
                          Center(
                            child: GestureDetector(
                              onTap: () => widget.onTap!(image),
                              child: Container(
                                width: constraints.maxWidth - 6,
                                height: constraints.maxHeight - 6,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                ),
                                child: const Loading(
                                  brightness: Brightness.light,
                                  radius: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (widget.canBeDelete == true)
              Positioned(
                right: -13,
                top: -13,
                child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFB4B53),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: widget.onRemove != null
                      ? () => widget.onRemove!(image)
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }

  void updateState(ImagePicked image) {
    if (mounted) {
      setState(() {
        _image = image;
      });
    }
  }
}

extension ImagePickerWidgetAction on _ImagePickerWidgetState {
  Future<void> _showImagePickerActionDialog() async {
    if (!await PermissionService.requestPermission(
      Permission.storage,
    )) {
      return;
    }

    if (widget.sources.length == ImageSource.values.length) {
      if (Platform.isAndroid) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.only(top: 24),
              title: Text(
                widget.title ?? 'Chọn hình ảnh',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              content: Wrap(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pop();
                            _openCamera();
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.camera_alt,
                                color: AppColor.primaryColor,
                                size: 48,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Máy ảnh',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pop();
                            _openGallery();
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.image,
                                color: AppColor.primaryColor,
                                size: 48,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Thư viện',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Hủy'),
                ),
              ],
            );
          },
        );
      } else {
        return showActionDialog(
          context,
          title: widget.title ?? 'Chọn hình ảnh',
          // subTitle: widget.message ?? '',
          actions: {
            'Máy ảnh': _openCamera,
            'Thư viện': _openGallery,
          },
        );
      }
    } else {
      if (widget.sources.contains(ImageSource.camera)) {
        return _openCamera();
      } else if (widget.sources.contains(ImageSource.gallery)) {
        return _openGallery();
      }
    }
  }

  void cleanImageCache() {
    imageCache.clear();
  }

  Future<void> _openGallery() async {
    final pickedFile = await picker
        .pickImage(source: ip.ImageSource.gallery)
        .then(Future<ip.XFile?>.value)
        .catchError(
          (error, stackTrace) => LogUtils.eCatch<ip.XFile>(
            '_openGalleryToChoosePhoto',
            error,
            stackTrace,
          ),
        );
    if (pickedFile != null && pickedFile.path.isNotEmpty == true) {
      final file = File(pickedFile.path);
      cleanImageCache();

      _onImagePicked(file);
      unawaited(_uploadImage(file));
    }
  }

  Future<void> _openCamera() async {
    if (await PermissionService.requestPermission(
      Permission.camera,
    )) {
      var pickedFile = await picker
          .pickImage(source: ip.ImageSource.camera)
          .then(Future<ip.XFile?>.value)
          .catchError(
            (error, stackTrace) => LogUtils.eCatch<ip.XFile>(
              '_openCameraToCapturePhoto',
              error,
              stackTrace,
            ),
          );

      if (pickedFile == null) {
        final response = await picker.retrieveLostData();
        if (response.isEmpty) {
          return;
        }
        if (response.files != null) {
          pickedFile = response.files?.first;
        }
      }

      if (pickedFile != null && pickedFile.path.isNotEmpty == true) {
        final file = File(pickedFile.path);
        cleanImageCache();

        _onImagePicked(file);
        unawaited(_uploadImage(file));
      }
    }
  }

  void _onImagePicked(File imageFile) {
    final newImage = _image!.copyWith(
      imageFile: imageFile,
      isLoading: true,
    );
    updateState(
      newImage.copyWith(),
    );

    widget.onImagePicked?.call(newImage);
  }

  Future<void> _uploadImage(File imageFile) async {
    final result = await FirebaseStorageService.uploadFile(
      file: imageFile,
      fileName: _generateFileName(),
      folder: 'uploads/${widget.uploadFolder}',
    ).then(Future<CloudStorageResult?>.value).catchError(
          (error, stackTrace) => LogUtils.eCatch(
            '_uploadImage',
            error,
            stackTrace,
          ),
        );

    if (result?.url?.isNotEmpty == true) {
      logger.d('get result upload', result?.url);
      widget.onImageUploadSucceed?.call(
        _image!.copyWith(
          imageFile: imageFile,
          url: result!.url,
          isLoading: false,
        ),
      );

      updateState(
        _image!.copyWith(
          imageFile: imageFile,
          url: result!.url,
          isLoading: false,
        ),
      );
    } else {
      widget.onImageUploadFailed?.call(_image);
    }
  }

  String _generateFileName() {
    return '''${const Uuid().v4()}_${DateTime.now().toUtc()}''';
  }
}
