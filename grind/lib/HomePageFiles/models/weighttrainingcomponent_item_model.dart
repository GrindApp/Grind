import '../../core/utils/image_constant.dart';

/// This class is used in the [weighttrainingcomponent_item_widget] screen.
class WeighttrainingcomponentItemModel {
  WeighttrainingcomponentItemModel({
    this.image,
    this.text,
    this.id,
  }) {
    image = image ?? ImageConstant.imgMapGym;
    text = text ?? "Weight Training";
    id = id ?? "";
  }

  String? image;

  String? text;

  String? id;
}
