import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';

import '../../ViewModel/app_services.dart';
import '../widgets/begin_button.dart';
import '../widgets/number_of_people_animation.dart';
import '../widgets/number_of_people_selection.dart';

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

  @override
  Widget build(BuildContext context) {
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
            child: ListView(
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
                                          color: Colors.white, fontSize: 15.sp),
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
                          return Wrap(
                            children: List.generate(value.numberOfUsersEntered,
                                (index) => Text("1")),
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
    );
  }
}
