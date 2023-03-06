import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:ordering_system/Core/Shared/shared_methods.dart';
import 'package:ordering_system/Presentation/assign_items_to_user/screens/arrang_user_with_items_screen.dart';
import 'package:ordering_system/ViewModel/app_services.dart';
import 'package:provider/provider.dart';

class NumberOfPeopleSelection extends StatefulWidget {
  const NumberOfPeopleSelection({
    super.key,
  });

  @override
  State<NumberOfPeopleSelection> createState() =>
      _NumberOfPeopleSelectionState();
}

class _NumberOfPeopleSelectionState extends State<NumberOfPeopleSelection> {
  bool showNumberField = false;
  final TextEditingController _numberOfPeople = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    showNumberFieldMethod();
    super.initState();
  }

  showNumberFieldMethod() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          showNumberField = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              bottom: showNumberField ? 400.h : 300.h,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: ZoomIn(
                  child: AutoSizeText(
                "Time to add the people number in the order",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            if (showNumberField) ...[
              Positioned(
                bottom: 300.h,
                child: Column(
                  children: [
                    FadeIn(
                      delay: const Duration(seconds: 1),
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: Center(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _numberOfPeople,
                            textAlign: TextAlign.center,
                            enabled: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (int.parse(value!) > 10) {
                                displayErrorToast(context,
                                    "Maximum number of people is 10 only");
                                return "";
                              } else if (int.parse(value) == 0) {
                                displayErrorToast(
                                    context, "Please enter at least one user");
                                return "";
                              }
                              return null;
                            },
                            cursorColor: AppColors.whiteColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.h),
                              filled: true,
                              fillColor: Colors.white70,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.black.withOpacity(0.4)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _numberOfPeople.text != ""
                        ? InkWell(
                            onTap: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              } else {
                                Provider.of<AppServices>(context, listen: false)
                                    .setNumberOfUsersEntered(
                                        int.parse(_numberOfPeople.text));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ArrangUserWithItemsScreen(
                                              userLength: int.parse(
                                                  _numberOfPeople.text
                                                      .toString())),
                                    ));
                              }
                            },
                            child: FadeIn(
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                shadowColor: Colors.black,
                                color: Colors.transparent,
                                child: const Icon(
                                  Icons.check_circle_sharp,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
