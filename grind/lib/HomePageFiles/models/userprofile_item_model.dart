import '../../core/utils/image_constant.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.userName,
    this.martialArtAnd,
    this.locationText,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgRectangle24198;
    userName = userName ?? "5.0";
    martialArtAnd = martialArtAnd ?? "Martial Art and Strength Zone";
    locationText = locationText ?? "500 meters away";
    id = id ?? "";
  }

  String? userImage;

  String? userName;

  String? martialArtAnd;

  String? locationText;

  String? id;
}
