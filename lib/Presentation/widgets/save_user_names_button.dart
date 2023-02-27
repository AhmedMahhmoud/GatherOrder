import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

import '../../ViewModel/app_services.dart';
import '../widgets/begin_button.dart';
import '../widgets/number_of_people_animation.dart';
import '../widgets/number_of_people_selection.dart';

class SaveUserNamesButton extends StatelessWidget {
  const SaveUserNamesButton({
    super.key,
    required this.formKey,
    required this.value,
    required this.userMap,
  });
  final AppServices value;
  final GlobalKey<FormState> formKey;
  final Map<String, String> userMap;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(milliseconds: 200 * value.numberOfUsersEntered),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 35.h,
          child: MaterialButton(
              color: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                } else {
                  formKey.currentState!.save();
                  print(userMap);
                }
              },
              child: const Center(
                child: AutoSizeText(
                  "Save",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.blackColor),
                ),
              )),
        ),
      ),
    );
  }
}
