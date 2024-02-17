import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import 'chipviewframe_item_model.dart';

class ChipviewframeItemWidget extends StatelessWidget {
  ChipviewframeItemWidget(
    this.chipviewframeItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  final ChipviewframeItemModel chipviewframeItemModelObj;

  final Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    // Determine if any of the elements in the isSelected list are true
    bool isSelected = chipviewframeItemModelObj.isSelected!.contains(true);

    return RawChip(
      padding: EdgeInsets.only(
        top: 7,
        right: 10,
        left: 10,
        bottom: 7,
      ),
      // showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewframeItemModelObj.checkmark!,
        style: TextStyle(
          color: appTheme.gray500,
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgCheckmark,
        height: 55,
        width: 55,
        margin: EdgeInsets.only(
          right: 8,
        ),
      ),
      selected: isSelected,
      backgroundColor: appTheme.gray900,
      selectedColor: appTheme.gray900,
      shape: isSelected
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.gray500.withOpacity(0.1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                2,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                2,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
