import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:provider/provider.dart';

import '../../Model/items.dart';
import '../../ViewModel/items/iterms_services.dart';

class SaveItemsButton extends StatelessWidget {
  const SaveItemsButton({super.key, required this.item});
  final Items item;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 35.h,
        child: MaterialButton(
            elevation: 5,
            color: AppColors.successColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              bool itemAdded = Provider.of<ItemServices>(context, listen: false)
                  .addNewItem(item, context);
              if (itemAdded) {
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () => Navigator.pop(context),
                );
              }
            },
            child: const Center(
              child: AutoSizeText(
                "Save",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.whiteColor),
              ),
            )),
      ),
    );
  }
}
