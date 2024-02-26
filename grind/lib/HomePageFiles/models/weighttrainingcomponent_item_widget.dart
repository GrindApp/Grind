import 'package:flutter/material.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../widgets/custom_image_view.dart';
import '../models/weighttrainingcomponent_item_model.dart';

// ignore: must_be_immutable
class WeighttrainingcomponentItemWidget extends StatelessWidget {
  WeighttrainingcomponentItemWidget(
    this.weighttrainingcomponentItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  WeighttrainingcomponentItemModel weighttrainingcomponentItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 78,
          width: 78,
          padding: EdgeInsets.all(23),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: CustomImageView(
            imagePath: weighttrainingcomponentItemModelObj?.image,
            height: 32,
            width: 32,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 7),
        Text(
          weighttrainingcomponentItemModelObj.text!,
          style: CustomTextStyles.bodySmallGray2008,
        ),
      ],
    );
  }
}
