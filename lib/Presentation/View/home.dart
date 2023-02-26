import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:ordering_system/Core/ColorManager/app_colors.dart';

import '../../ViewModel/app_services.dart';
import '../widgets/begin_button.dart';
import '../widgets/number_of_people_selection.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Consumer<AppServices>(
                builder: (context, value, _) {
                  if (!value.beginApp) {
                    return Center(
                      child: FadeIn(
                          delay: const Duration(seconds: 1),
                          child: Column(
                            children: [
                              Text(
                                "Are you ready to make your order ?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              ),
                              const BeginButton()
                            ],
                          )),
                    );
                  }
                  return const NumberOfPeopleSelection();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
