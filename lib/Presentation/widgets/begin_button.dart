import 'package:flutter/material.dart';
import '../../Core/ColorManager/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/app_services.dart';

class BeginButton extends StatefulWidget {
  const BeginButton({super.key});

  @override
  State<BeginButton> createState() => _BeginButtonState();
}

class _BeginButtonState extends State<BeginButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {}
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: MaterialButton(
        elevation: 4,
        color: AppColors.whiteColor,
        onPressed: () async {
          _animationController.forward();
          await Future.delayed(
            const Duration(milliseconds: 800),
            () {
              Provider.of<AppServices>(context, listen: false).startOrder();
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Center(
            child: Text(
          "BEGIN",
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
      ).animate(autoPlay: false, controller: _animationController, effects: [
        const ShakeEffect(
            duration: Duration(seconds: 800), offset: Offset(0, 1)),
        const FadeEffect(
            begin: 1,
            end: 0,
            duration: Duration(milliseconds: 800),
            curve: Curves.slowMiddle),
      ]),
    );
  }
}
