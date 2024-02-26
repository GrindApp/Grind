// // ignore_for_file: must_be_immutable
//
// import 'package:equatable/equatable.dart';
// import 'chipviewframe_item_model.dart';
//
// /// This class defines the variables used in the [milestone_screen],
// /// and is typically used to hold data that is passed between different parts of the application.
// class MilestoneModel extends Equatable {
//   MilestoneModel({this.chipviewframeItemList = const []}) {}
//
//   List<ChipviewframeItemModel> chipviewframeItemList;
//
//   MilestoneModel copyWith(
//       {List<ChipviewframeItemModel>? chipviewframeItemList}) {
//     return MilestoneModel(
//       chipviewframeItemList:
//           chipviewframeItemList ?? this.chipviewframeItemList,
//     );
//   }
//
//   @override
//   List<Object?> get props => [chipviewframeItemList];
// }
