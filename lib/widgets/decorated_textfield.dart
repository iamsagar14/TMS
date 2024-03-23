// ignore_for_file: public_member_api_docs, sort_constructors_first
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/utils/form_input.dart';


mixin DecoratedBorder on Widget {
  OutlineInputBorder buildBorder(
      {Color? color, double width = 1.0, double borderRadius = 50}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: color != null
          ? BorderSide(color: color, width: width)
          : const BorderSide(),
    );
  }
}

class DecoratedTextField extends StatefulWidget with DecoratedBorder {
  final TextInputType? inputType;
  final bool hinttextalin;
  final double borderRadius;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? currentValue;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final ValidationError? validationError;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Function()? onTap;
  final bool fillcolor;
  const DecoratedTextField({
    Key? key,
    this.inputType,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.currentValue,
    this.validationError,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.labelText,
    this.minLines = 1,
    this.maxLines = 1,
    this.helperText,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius = 50,
    this.hinttextalin = true,
    this.fillcolor = true,
  }) : super(key: key);
  @override
  State<DecoratedTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<DecoratedTextField> {
  bool get isPasswordField => widget.inputType == TextInputType.visiblePassword;

  bool obscureText = true;
  @override
  void dispose() {
    super.dispose();
  }

  _fieldFocusChange(
      {required BuildContext context,
      required FocusNode focusNode,
      required FocusNode nextFocusNode}) {
    focusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.hinttextalin == true ? TextAlign.left : TextAlign.left,
      initialValue: widget.currentValue,
      controller: widget.controller,
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onFieldSubmitted: (val) {
        if (widget.nextFocusNode != null && widget.focusNode != null) {
          _fieldFocusChange(
              context: context,
              focusNode: widget.focusNode!,
              nextFocusNode: widget.nextFocusNode!);
        }
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(val);
        }
      },
      cursorHeight: 22,
      keyboardType: widget.inputType,
      cursorColor: context.appPrimaryColor,
      textCapitalization: widget.textCapitalization,
      obscureText: isPasswordField && obscureText,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      textInputAction: widget.nextFocusNode != null
          ? TextInputAction.next
          : widget.textInputAction,
      enabled: widget.enabled,
      style: context.bodysmall,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: context.bodysmall,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: context.bodysmall,
        filled: widget.fillcolor,
        fillColor: widget.fillcolor ? const Color(0xFFEEEEEE) : null,
        hintText: widget.hintText,
        helperText: widget.helperText,
        enabled: widget.enabled,
        prefixIcon: widget.prefixIcon,
        errorMaxLines: 2,
        errorText: widget.validationError != null
            ? widget.validationError != ValidationError.empty
                ? widget.validationError!.errorText
                : null
            : null,
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: context.appTextLightBlackColor,
                  size: 16,
                ),
              )
            : widget.suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: widget.buildBorder(
            color: context.appTextWhiteColor,
            borderRadius: widget.borderRadius),
        enabledBorder: widget.validationError == ValidationError.empty
            ? widget.buildBorder(
                color: Colors.red, width: 2, borderRadius: widget.borderRadius)
            : widget.currentValue != null
                ? widget.currentValue!.isNotEmpty
                    ? widget.buildBorder(
                        color: context.appTextLightBlackColor,
                        borderRadius: widget.borderRadius)
                    : widget.buildBorder(
                        color: context.appTextLightBlackColor,
                        borderRadius: widget.borderRadius)
                : widget.buildBorder(
                    width: 1,
                    color: widget.fillcolor
                        ? context.appTextWhiteColor
                        : context.borderColor,
                    borderRadius: widget.borderRadius),
        focusedBorder: widget.buildBorder(
            color: context.appPrimaryColor,
            width: 2,
            borderRadius: widget.borderRadius),
        errorBorder: widget.buildBorder(
            color: Colors.red, width: 2, borderRadius: widget.borderRadius),
        disabledBorder: widget.validationError == ValidationError.empty
            ? widget.buildBorder(
                color: Colors.red, borderRadius: widget.borderRadius)
            : widget.buildBorder(
                color: context.appTextLightBlackColor,
                borderRadius: widget.borderRadius),
        hintStyle: context.bodysmall,
        helperStyle: context.bodysmall,
        errorStyle: context.bodysmall,
      ),
    );
  }
}
