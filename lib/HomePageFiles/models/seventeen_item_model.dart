import '../../core/utils/image_constant.dart';

/// This class is used in the [seventeen_item_widget] screen.
class SeventeenItemModel {
  SeventeenItemModel({
    this.rectangle,
    this.id,
  }) {
    rectangle = rectangle ?? ImageConstant.imgRectangle24194;
    id = id ?? "";
  }

  String? rectangle;

  String? id;
}
