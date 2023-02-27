import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../ColorManager/app_colors.dart';

displayErrorToast(BuildContext context, String errorMsg) {
  showToast(errorMsg,
      borderRadius: BorderRadius.circular(20),
      context: context,
      duration: const Duration(seconds: 3),
      animation: StyledToastAnimation.slideFromTop,
      textStyle: TextStyle(fontSize: 17.sp, color: AppColors.whiteColor),
      alignment: Alignment.topCenter,
      backgroundColor: AppColors.errorColor,
      position: StyledToastPosition.top);
}
