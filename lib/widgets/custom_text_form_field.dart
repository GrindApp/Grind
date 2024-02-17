import 'package:flutter/material.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    // this.emailController, // Email controller
    // this.passwordController, // Password controller
    this.focusNode,
    this.showPasswordToggle = false,
    this.textStyle,
    this.obscureText = true,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    required Color cursorColor,
    this.onChanged,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final bool showPasswordToggle;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final TextStyle? textStyle;

  late final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  // final TextEditingController? emailController; // Email controller
  // final TextEditingController? passwordController; // Password controller

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: widget.controller,
          style:
              widget.textStyle ?? CustomTextStyles.bodyMediumOnPrimaryContainer,
          cursorColor: Colors.white,
          obscureText:
              !_obscureText, // Toggle obscureText based on _obscureText state
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration.copyWith(
            suffixIcon: widget.showPasswordToggle
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Toggle _obscureText state
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle:
            widget.hintStyle ?? CustomTextStyles.bodyMediumOnPrimaryContainer,
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.suffix,
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding,
        fillColor: widget.fillColor,
        filled: widget.filled,
        border: widget.borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primaryContainer,
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primaryContainer,
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primaryContainer,
              ),
            ),
      );
}
