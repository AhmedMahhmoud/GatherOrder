import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.isObscure = false,
      this.style,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.onTap,
      this.errorBorder,
      this.suffixIcon,
      this.intialValue,
      this.hintText,
      this.disabledBorder,
      this.hintStyle,
      this.enabledBorder,
      this.prefixIcon,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.textInputType = TextInputType.name,
      this.textEditingController,
      this.focusNode,
      this.inputFormatters});
  final TextInputType textInputType;
  final bool isObscure;
  final TextStyle? style;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? intialValue;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isObscure,
      style: style,
      initialValue: intialValue,
      onChanged: onChanged,
      onTap: onTap,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      cursorHeight: 20,
      cursorColor: AppColors.whiteColor,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: hintText,
        prefixIcon: prefixIcon,
        labelStyle: hintStyle,
        hintStyle: hintStyle,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff363636),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        disabledBorder: disabledBorder,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
