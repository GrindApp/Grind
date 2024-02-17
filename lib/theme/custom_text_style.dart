import 'package:flutter/material.dart';
import 'package:mohsin_s_application4/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray200 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray200,
      );
  static get bodyLargeGray20018 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray200,
        fontSize: 18,
      );
  static get bodyLargeGray200_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray200,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyLarge_2 => theme.textTheme.bodyLarge!;
  static get bodyMedium7fededed => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0X7FEDEDED),
      );
  static get bodyMediumGray200 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray200,
      );
  static get bodyMediumGray200_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray200.withOpacity(0.3),
      );
  static get bodyMediumGray200_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray200.withOpacity(0.5),
      );
  static get bodyMediumGray200_3 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray200,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray500_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray500_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMedium_1 => theme.textTheme.bodyMedium!;
  static get bodyMediumffededed => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFFEDEDED),
      );
  static get bodyMediumffededed_1 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFFEDEDED),
      );
  static get bodyMediumffffffff => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get bodySmallGray200 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray200,
      );
  static get bodySmallGray2008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray200.withOpacity(0.5),
        fontSize: 8,
      );
  static get bodySmallGray2008_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray200,
        fontSize: 8,
      );
  static get bodySmallGray200_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray200.withOpacity(0.5),
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
        fontSize: 12,
      );
  static get bodySmallGray500_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallOnError => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onError,
        fontSize: 12,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12,
      );
  static get bodySmallffededed => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFEDEDED),
      );
  static get bodySmallffffc107 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFFC107),
        fontSize: 12,
      );
  static get bodySmallffffffff => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 12,
      );
  // Headline text style
  static get headlineSmallBluegray50 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray50,
        fontSize: 25,
        fontWeight: FontWeight.w200,
      );
  static get headlineSmallGray500 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallWhiteA700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumRedA200 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.redA200,
        fontWeight: FontWeight.w700,
      );
  // Roboto text style
  static get roboto33ffffff => TextStyle(
        color: Color(0X33FFFFFF),
        fontSize: 74,
        fontWeight: FontWeight.w200,
      ).roboto;
  static get robotoWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 74,
        fontWeight: FontWeight.w200,
      ).roboto;
  // Robotoff text style
  static get robotoff1c1e20 => TextStyle(
        color: Color(0XFF1C1E20),
        fontSize: 74,
        fontWeight: FontWeight.w300,
      ).roboto;
  // Robotoffffffff text style
  static get robotoffffffff => TextStyle(
        color: Color(0XFFFFFFFF),
        fontSize: 74,
        fontWeight: FontWeight.w200,
      ).roboto;
  // Title style
  static get titleLarge_1 => theme.textTheme.titleLarge!;
  static get titleSmallExtraBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get titleSmallRedA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.redA200,
      );
  static get titleSmallb2ededed => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XB2EDEDED),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallfff9545e => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFF9545E),
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
