import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../common_widget/after_layout.dart';
import '../theme/shadow.dart';
import '../theme/theme_button.dart';
import '../theme/theme_color.dart';

enum SubmitFormMode { fixed, scroll }

class RightActionButtonModel {
  final String title;
  final Function() onTap;

  RightActionButtonModel({required this.title, required this.onTap});
}

class CustomSubmitScreenForm extends StatefulWidget {
  final String? submitBtnTitle;
  final String? cancelBtnTitle;
  final Widget? child;
  final Function()? onCancel;
  final Function()? onConfirm;
  final Function()? onClosePressed;
  final String? title;
  final bool isBackButtonVisible;
  final SubmitFormMode mode;
  final String? des;
  final bool isShowAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomButtonEtx;
  final Widget? floatingButton;
  final ScrollController? scrollController;
  final Color? titleColor;
  final Widget? customOneButton;
  final ValueNotifier<bool>? enableSubmit;
  final bool isShowBottomButton;
  final bool isStockOutHeader;
  final List<RightActionButtonModel>? rightActionButton;
  final bool? isShowBottomNayvigationBar;
  final Widget? bottomAppBar;
  final Widget rightIconButton;
  final bool? isShowRightIconButton;

  CustomSubmitScreenForm({
    Key? key,
    this.submitBtnTitle,
    this.cancelBtnTitle,
    this.child,
    this.onCancel,
    this.onConfirm,
    this.title,
    this.des,
    this.isBackButtonVisible = false,
    this.mode = SubmitFormMode.fixed,
    this.isShowAppBar = true,
    this.resizeToAvoidBottomInset = true,
    this.bottomButtonEtx,
    this.floatingButton,
    this.scrollController,
    this.titleColor = Colors.black,
    this.customOneButton,
    this.enableSubmit,
    this.isShowBottomButton = true,
    this.isStockOutHeader = true,
    this.rightActionButton,
    this.onClosePressed,
    this.isShowBottomNayvigationBar,
    this.bottomAppBar,
    this.isShowRightIconButton,
    this.rightIconButton = const Text(''),
  }) : super(key: key);

  @override
  _CustomSubmitScreenFormState createState() => _CustomSubmitScreenFormState();
}

class _CustomSubmitScreenFormState extends State<CustomSubmitScreenForm>
    with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    AppColor.setDarkStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      floatingActionButton: widget.floatingButton,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => CommonFunction.hideKeyBoard(context),
        child: widget.isShowAppBar
            ? Container(
                child: Column(
                  children: [
                    _buildAppBar(context),
                    Expanded(
                      child: _buildBodyByMode(),
                    ),
                  ],
                ),
              )
            : _buildBodyByMode(),
      ),
      bottomNavigationBar: widget.isShowBottomNayvigationBar == true
          ? widget.bottomAppBar
          : null,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(top: padding.top + 16),
      decoration: const BoxDecoration(
        color: AppColor.blue001D37,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => widget.onClosePressed != null
                ? widget.onClosePressed?.call()
                : Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: widget.titleColor,
            ),
          ),
          const SizedBox(width: 4),
          widget.isStockOutHeader
              ? _buildStockOutOrderHeader()
              : _buildStockInOrderHeader(),
          if (widget.rightActionButton != null) ...[_rightButton()],
          widget.rightIconButton,
        ],
      ),
    );
  }

  Widget _buildStockOutOrderHeader() {
    final _theme = Theme.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Text(
              widget.title ?? '',
              style: _theme.textTheme.headline3?.copyWith(
                color: widget.titleColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.des?.isNotEmpty == true) const SizedBox(height: 4),
                if (widget.des?.isNotEmpty == true)
                  Expanded(
                    child: Text(
                      widget.des ?? '',
                      style: _theme.textTheme.subtitle2,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInOrderHeader() {
    final _theme = Theme.of(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        '${widget.title ?? ''}',
                        style: _theme.textTheme.headline3?.copyWith(
                          color: widget.titleColor,
                        ),
                      ),
                      if (widget.des?.isNotEmpty == true)
                        const SizedBox(height: 4),
                      if (widget.des?.isNotEmpty == true)
                        Text(
                          widget.des ?? '',
                          style: _theme.textTheme.subtitle2,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyByMode() {
    if (widget.mode == SubmitFormMode.fixed) {
      return _buildFixedBody(context);
    }
    return _buildScrollBody(context);
  }

  Widget _buildFixedBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: widget.child ?? const SizedBox(),
        ),
        widget.isShowBottomButton
            ? (widget.customOneButton != null
                ? _buildOneBottomButton(context)
                : _buildBottomButtons(context))
            : const SizedBox()
      ],
    );
  }

  Widget _buildScrollBody(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: widget.child ?? const SizedBox(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              children: [
                widget.isShowBottomButton
                    ? (widget.customOneButton != null
                        ? _buildOneBottomButton(context)
                        : _buildBottomButtons(context))
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    final device = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: 18,
        bottom: 12 + device.padding.bottom,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.bottomButtonEtx != null) widget.bottomButtonEtx!,
          Row(
            children: [
              Expanded(
                child: ThemeButton.notRecommend(
                  context: context,
                  title: widget.cancelBtnTitle ?? '--',
                  onPressed: widget.onCancel,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ThemeButton.recommend(
                  enable: widget.enableSubmit?.value != false,
                  context: context,
                  title: widget.submitBtnTitle ?? '--',
                  onPressed: widget.onConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOneBottomButton(BuildContext context) {
    final device = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: 18,
        bottom: 12 + device.padding.bottom,
        left: 16,
        right: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.bottomButtonEtx != null) widget.bottomButtonEtx!,
          Row(
            children: [
              Expanded(
                child: widget.customOneButton!,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rightButton() => PopupMenuButton<RightActionButtonModel>(
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
        onSelected: (item) => item.onTap.call(),
        itemBuilder: (_) => [
          ...?widget.rightActionButton?.map(
            (e) => PopupMenuItem<RightActionButtonModel>(
              value: e,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    e.title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
