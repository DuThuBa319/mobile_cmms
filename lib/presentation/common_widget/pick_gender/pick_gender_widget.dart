import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
import '../../../common/constants.dart';
import '../../theme/theme_color.dart';

part 'pick_gender_controller.dart';

class PickGenderWidget extends StatelessWidget {
  final PickGenderController? controller;

  const PickGenderWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ValueListenableBuilder<GenderPickProperties>(
      valueListenable: controller ?? PickGenderController(),
      builder: (ctx, value, w) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller?.setValue(Gender.male.index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(
                          value.isMale ? 0x29478AFB : 0xFFFFFFFF,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: value.isMale
                              ? AppColor.primaryColor
                              : Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            value.isMale ? Assets.icRadioOn : Assets.icRadioOff,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Nam',
                              style: value.isMale
                                  ? themeData.textTheme.bodyLarge
                                  : themeData.textTheme.titleSmall,
                            ),
                          ),
                          SvgPicture.asset(
                            value.isMale
                                ? Assets.icMaleActive
                                : Assets.icMaleInactive,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller?.setValue(Gender.female.index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(
                          value.isFemale ? 0x29478AFB : 0xFFFFFFFF,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            value.isFemale
                                ? Assets.icRadioOn
                                : Assets.icRadioOff,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Nữ',
                              style: value.isFemale
                                  ? themeData.textTheme.bodyLarge
                                  : themeData.textTheme.titleSmall,
                            ),
                          ),
                          SvgPicture.asset(
                            value.isFemale
                                ? Assets.icFemaleActive
                                : Assets.icFemaleInactive,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                controller?.setValue(Gender.other.index);
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(value.isOther ? 0x29478AFB : 0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: value.isOther ? AppColor.primaryColor : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      value.isOther ? Assets.icRadioOn : Assets.icRadioOff,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Khác',
                        style: value.isOther
                            ? themeData.textTheme.bodyLarge
                            : themeData.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
