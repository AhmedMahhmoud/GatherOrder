import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/app_services.dart';
import '../widgets/number_of_people_selection.dart';

class PeopleSelectionAnimation extends StatelessWidget {
  const PeopleSelectionAnimation({
    super.key,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppServices>(
      builder: (context, value, _) {
        if (value.usersNumberEntered) {
          _animationController.forward();
        }
        return const NumberOfPeopleSelection().animate(
            autoPlay: false,
            controller: _animationController,
            effects: [
              const FadeEffect(
                  duration: Duration(seconds: 1),
                  begin: 1,
                  end: 0,
                  curve: Curves.linearToEaseOut)
            ]);
      },
    );
  }
}
