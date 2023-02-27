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
import '../widgets/save_user_names_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Map<String, String> userMap = {};
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ));
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final appServiceProv = Provider.of<AppServices>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: Align(
                alignment: appServiceProv.usersNumberEntered
                    ? Alignment.topLeft
                    : Alignment.center,
                child: ListView(
                  physics: appServiceProv.usersNumberEntered
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Consumer<AppServices>(
                          builder: (context, value, _) {
                            if (!value.beginApp) {
                              return FadeIn(
                                  delay: const Duration(seconds: 1),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Lottie.network(
                                            "https://assets8.lottiefiles.com/private_files/lf30_rnizksef.json"),
                                        Text(
                                          "Are you ready to make your order ?",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const BeginButton()
                                      ],
                                    ),
                                  ));
                            }
                            if (value.usersNumberEntered) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      const AutoSizeText(
                                        "Enter user names",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      const Divider(
                                        color: AppColors.greyColor,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                120.h,
                                        child: ListView(
                                          physics: BouncingScrollPhysics(),
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Wrap(
                                                spacing: 10.w,
                                                runSpacing: 15.h,
                                                children: List.generate(
                                                    value.numberOfUsersEntered,
                                                    (index) => SlideInRight(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    400),
                                                        delay: Duration(
                                                            milliseconds:
                                                                200 * index),
                                                        child: SizedBox(
                                                            child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              children: [
                                                                const Icon(
                                                                  (Icons
                                                                      .person),
                                                                  color: AppColors
                                                                      .greyColor,
                                                                ),
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),
                                                                AutoSizeText(
                                                                  "User ${index + 1}",
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: AppColors
                                                                          .whiteColor),
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                                child:
                                                                    Container()),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.5,
                                                                  child:
                                                                      CustomTextField(
                                                                    validator:
                                                                        (p0) {
                                                                      if (p0
                                                                          .toString()
                                                                          .isEmpty) {
                                                                        return "Can't be empty";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    style: const TextStyle(
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                    onSaved:
                                                                        (p0) {
                                                                      userMap['$index'] =
                                                                          p0.toString();
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
                                      ),
                                      FadeIn(
                                        delay: Duration(
                                            milliseconds: 200 *
                                                value.numberOfUsersEntered),
                                        child: const Divider(
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      SaveUserNamesButton(
                                          value: value,
                                          formKey: formKey,
                                          userMap: userMap),
                                      const SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            return PeopleSelectionAnimation(
                                animationController: _animationController);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
