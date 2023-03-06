// import 'package:animate_do/animate_do.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ordering_system/Core/ColorManager/app_colors.dart';
// import 'package:ordering_system/Presentation/View/items_selection_page.dart';
// import 'package:ordering_system/Presentation/assign_items_to_user/screens/arrang_user_with_items_screen.dart';
// import 'package:ordering_system/ViewModel/users_services.dart';
// import 'package:provider/provider.dart';
// import '../../ViewModel/app_services.dart';

// class SaveUserNamesButton extends StatelessWidget {
//   const SaveUserNamesButton({
//     super.key,
//     required this.formKey,
//     required this.value,
//     required this.userMap,
//   });
//   final AppServices value;
//   final GlobalKey<FormState> formKey;
//   final Map<String, String> userMap;

//   @override
//   Widget build(BuildContext context) {
//     return FadeIn(
//       delay: Duration(milliseconds: 200 * value.numberOfUsersEntered),
//       child: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           height: 35.h,
//           child: MaterialButton(
//               color: AppColors.whiteColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               onPressed: () {
//                 if (!formKey.currentState!.validate()) {
//                   return;
//                 } else {
//                   formKey.currentState!.save();
//                   // Provider.of<UsersServices>(context, listen: false)
//                   //     .addUsers(userMap);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ArrangUserWithItemsScreen(
//                           userLength: userMap.length,
//                         ),
//                       ));
//                 }
//               },
//               child: const Center(
//                 child: AutoSizeText(
//                   "Save",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: AppColors.blackColor),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
