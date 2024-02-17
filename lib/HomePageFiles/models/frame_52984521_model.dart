// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'fitnesscenter_item_model.dart';
import 'seventeen_item_model.dart';
import 'userprofile_item_model.dart';
import 'weighttrainingcomponent_item_model.dart';

class SelectionPopupModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;

  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });
}

/// This class defines the variables used in the [frame_52984521_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Frame52984521Model extends Equatable {
  Frame52984521Model({
    this.dropdownItemList = const [],
    this.weighttrainingcomponentItemList = const [],
    this.seventeenItemList = const [],
    this.userprofileItemList = const [],
    this.fitnesscenterItemList = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<WeighttrainingcomponentItemModel> weighttrainingcomponentItemList;

  List<SeventeenItemModel> seventeenItemList;

  List<UserprofileItemModel> userprofileItemList;

  List<FitnesscenterItemModel> fitnesscenterItemList;

  Frame52984521Model copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<WeighttrainingcomponentItemModel>? weighttrainingcomponentItemList,
    List<SeventeenItemModel>? seventeenItemList,
    List<UserprofileItemModel>? userprofileItemList,
    List<FitnesscenterItemModel>? fitnesscenterItemList,
  }) {
    return Frame52984521Model(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      weighttrainingcomponentItemList: weighttrainingcomponentItemList ??
          this.weighttrainingcomponentItemList,
      seventeenItemList: seventeenItemList ?? this.seventeenItemList,
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
      fitnesscenterItemList:
          fitnesscenterItemList ?? this.fitnesscenterItemList,
    );
  }

  @override
  List<Object?> get props => [
        dropdownItemList,
        weighttrainingcomponentItemList,
        seventeenItemList,
        userprofileItemList,
        fitnesscenterItemList
      ];
}
