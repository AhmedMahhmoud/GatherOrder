import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../widgets/begin_button.dart';

class AnimatedBeginButton extends StatelessWidget {
  const AnimatedBeginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        delay: const Duration(seconds: 1),
        child: Center(
          child: Column(
            children: [
              Lottie.network(
                  "https://assets8.lottiefiles.com/private_files/lf30_rnizksef.json"),
              Text(
                "Are you ready to make your order ?",
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
              const SizedBox(
                height: 5,
              ),
              const BeginButton()
            ],
          ),
        ));
  }
}
