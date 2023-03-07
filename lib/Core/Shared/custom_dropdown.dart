import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  final List<DropdownMenuItem> dropDownMenuItems;
  final Function callBackFun;
  final String hint;
  final double? width;
  final double? height;
  final double? dropdownValuesWidth;
  final String? dropDownValue;
  final IconData? iconData;
  final String? Function(dynamic)? validatorFun;

  const CustomDropDown(
      {required this.dropDownMenuItems,
      required this.hint,
      required this.callBackFun,
      required this.dropDownValue,
      this.dropdownValuesWidth,
      this.validatorFun,
      this.width,
      this.height,
      this.iconData,
      super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? (160.w),
      height: widget.height ?? 30.h,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
            style: const TextStyle(color: AppColors.blackColor),
            validator: widget.validatorFun,
            alignment: Alignment.topLeft,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(bottom: 10.h, left: 10.w, right: 1.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            isExpanded: true,
            hint: SizedBox(
              child: AutoSizeText(
                widget.hint,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onChanged: (value) {
              widget.callBackFun(value);
            },
            value: widget.dropDownValue,
            buttonElevation: 2,
            dropdownWidth: widget.dropdownValuesWidth ?? (200.w),
            dropdownDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            dropdownElevation: 3,
            items: widget.dropDownMenuItems),
      ),
    );
  }
}
