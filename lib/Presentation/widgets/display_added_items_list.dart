import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/ViewModel/items/iterms_services.dart';
import 'package:provider/provider.dart';

class DisplayAddedItems extends StatelessWidget {
  const DisplayAddedItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80.h,
      left: 0,
      right: 0,
      child: Consumer<ItemServices>(
        builder: (context, value, _) {
          return Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 8,
              spacing: 8,
              children: List.generate(
                  value.items.length,
                  (index) => ZoomIn(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: Image.asset(
                                  "assets/images/plate.png",
                                  fit: BoxFit.cover,
                                  color: AppColors.whiteColor.withOpacity(0.8),
                                )),
                          ),
                          SizedBox(
                            width: 80.w,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  value.items[index].itemName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: InkWell(
                                onTap: () {
                                  Provider.of<ItemServices>(context,
                                          listen: false)
                                      .removeItemByName(
                                          value.items[index].itemName);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryColor),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ))
                        ],
                      ))).toList());
        },
      ),
    );
  }
}
