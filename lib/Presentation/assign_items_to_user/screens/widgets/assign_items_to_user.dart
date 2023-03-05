import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignItemsUser extends StatelessWidget {
  final int index;
  const AssignItemsUser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  const Icon(
                    (Icons.person),
                    color: AppColors.greyColor,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                    "User ${index + 1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: CustomTextField(
                      validator: (p0) {
                        if (p0.toString().isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      style: const TextStyle(color: AppColors.whiteColor),
                      onSaved: (p0) {
                        print(p0);
                      },
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 500.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  "Items",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
