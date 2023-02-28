import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:ordering_system/Presentation/widgets/display_users_list.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

import '../../ViewModel/app_services.dart';
import '../widgets/animated_begin_button.dart';
import '../widgets/begin_button.dart';
import '../widgets/number_of_people_animation.dart';
import '../widgets/save_user_names_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ));
    super.initState();
  }

  Map<String, String> userMap = {};

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
                              return const AnimatedBeginButton();
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
                                      DisplayUsersList(
                                          usersMap: userMap, value: value),
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
