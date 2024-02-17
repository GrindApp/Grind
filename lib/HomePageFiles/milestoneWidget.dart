import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_image_view.dart';
import 'models/chipviewframe_item_model.dart';
import 'models/chipviewframe_item_widget.dart';

class MilestoneScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          height: 318,
          width: 358,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.04,
                child: CustomImageView(
                  imagePath: ImageConstant.imgTopology1,
                  height: 309,
                  width: 358,
                  alignment: Alignment.center,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Goals",
                        style: CustomTextStyles.headlineSmallGray500,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "See all your this week goals here",
                        style: CustomTextStyles.bodyMediumGray500_1,
                      ),
                      SizedBox(height: 41),
                      // _buildChipViewFrame(context),
                      SizedBox(height: 42),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFluentTargetA,
                            height: 16,
                            width: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text(
                              "6 days remaining for your next goal",
                              style: CustomTextStyles.bodySmallWhiteA700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // Widget _buildChipViewFrame(BuildContext context) {
  //   // Mock data, replace it with your actual data
  //   List<ChipviewframeItemModel> chipviewframeItemList = [
  //     ChipviewframeItemModel(), // Replace with your actual models
  //     ChipviewframeItemModel(),
  //     ChipviewframeItemModel(),
  //     ChipviewframeItemModel(),
  //     ChipviewframeItemModel(),
  //     ChipviewframeItemModel(),
  //     ChipviewframeItemModel(),
  //   ];
  //
  //   return Wrap(
  //     runSpacing: 12,
  //     spacing: 12,
  //     children: List<Widget>.generate(
  //       chipviewframeItemList.length,
  //       (index) {
  //         ChipviewframeItemModel model = chipviewframeItemList[index];
  //
  //         return ChipviewframeItemWidget(model);
  //       },
  //     ),
  //   );
  // }
}
