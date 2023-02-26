import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

class NumberOfPeopleSelection extends StatefulWidget {
  const NumberOfPeopleSelection({
    super.key,
  });

  @override
  State<NumberOfPeopleSelection> createState() =>
      _NumberOfPeopleSelectionState();
}

class _NumberOfPeopleSelectionState extends State<NumberOfPeopleSelection> {
  bool showNumberField = false;
  @override
  void initState() {
    showNumberFieldMethod();
    super.initState();
  }

  showNumberFieldMethod() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          showNumberField = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
              child: AnimatedPadding(
            duration: const Duration(seconds: 1),
            padding: EdgeInsets.only(bottom: showNumberField ? 0 : 250.h),
            child: AutoSizeText(
              "Lets start by adding the number of people in the order ",
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
          )),
          if (showNumberField) ...[]
        ],
      ),
    );
  }
}
