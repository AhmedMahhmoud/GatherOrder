import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:ordering_system/Core/Shared/custom_dropdown.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/ViewModel/app_services.dart';
import 'package:ordering_system/ViewModel/items/iterms_services.dart';
import 'package:provider/provider.dart';

class AssignItemsUser extends StatelessWidget {
  final int index;
  final PageController pageController;
  AssignItemsUser(
      {super.key, required this.index, required this.pageController});
  final TextEditingController _quanitityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<ItemServices>(context, listen: false).items;
    String selectedItem = items.first.itemName;
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  const Icon(
                    (Icons.person),
                    color: AppColors.greyColor,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                    "User ${index + 1} ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: CustomTextField(
                      validator: (p0) {
                        if (p0.toString().isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      style: const TextStyle(color: AppColors.whiteColor),
                      onSaved: (p0) {},
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 500.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.greyColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const AutoSizeText(
                  "Add Items",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.greyColor.withOpacity(0.9),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "Item",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomDropDown(
                                dropDownMenuItems: items
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e.itemName,
                                          child: Text(
                                            e.itemName,
                                          ),
                                        ))
                                    .toList(),
                                hint: "Item",
                                callBackFun: (v) {
                                  selectedItem = v;
                                },
                                dropDownValue: selectedItem),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            const AutoSizeText(
                              "Quantity",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor),
                            ),
                            SizedBox(
                              width: 50.w,
                              height: 50.h,
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _quanitityController,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                  enabled: true,
                                  onChanged: (value) {},
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
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            child: MaterialButton(
              color: AppColors.greyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                pageController.animateToPage(index + 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              child: Center(
                child: Text(
                  index ==
                          Provider.of<AppServices>(context, listen: false)
                                  .numberOfUsersEntered -
                              1
                      ? "Finsh"
                      : "Next",
                  style: const TextStyle(
                      color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
