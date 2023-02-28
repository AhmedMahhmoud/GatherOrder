import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

import '../../ViewModel/app_services.dart';

class DisplayUsersList extends StatelessWidget {
  final Map<String, String> usersMap;
  final AppServices value;
  const DisplayUsersList(
      {required this.usersMap, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 120.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Wrap(
              spacing: 10.w,
              runSpacing: 15.h,
              children: List.generate(
                  value.numberOfUsersEntered,
                  (index) => SlideInRight(
                      duration: const Duration(milliseconds: 400),
                      delay: Duration(milliseconds: 200 * index),
                      child: SizedBox(
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
                                  style: const TextStyle(
                                      color: AppColors.whiteColor),
                                  onSaved: (p0) {
                                    usersMap['$index'] = p0.toString();
                                    print(p0);
                                  },
                                )),
                          ),
                        ],
                      )))),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
