import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:ordering_system/Presentation/assign_items_to_user/screens/widgets/assign_items_to_user.dart';
import 'package:ordering_system/ViewModel/app_services.dart';
import 'package:provider/provider.dart';

class ArrangUserWithItemsScreen extends StatelessWidget {
  final int userLength;
  ArrangUserWithItemsScreen({super.key, required this.userLength});
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Consumer<AppServices>(builder: (context, value, _) {
            return PageView.builder(
              controller: _pageController,
              itemCount: userLength,
              itemBuilder: (context, index) {
                return AssignItemsUser(
                  index: index,
                  pageController: _pageController,
                );
              },
            );
          })),
    );
  }
}
