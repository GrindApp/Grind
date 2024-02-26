import '../../core/utils/image_constant.dart';

/// This class is used in the [fitnesscenter_item_widget] screen.
class FitnesscenterItemModel {
  FitnesscenterItemModel({
    this.classImage,
    this.gymName,
    this.rating,
    this.distanceText,
    this.id,
  }) {
    classImage = classImage ?? ImageConstant.imgRectangle24194143x175;
    gymName = gymName ?? "Anytime Fitness";
    rating = rating ?? "5.0";
    distanceText = distanceText ?? "500 meters away";
    id = id ?? "";
  }

  String? classImage;

  String? gymName;

  String? rating;

  String? distanceText;

  String? id;
}
