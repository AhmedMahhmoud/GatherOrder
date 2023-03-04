import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:ordering_system/Model/items.dart';
import '../widgets/save_items_button.dart';

class AnimatedAddItemButton extends StatelessWidget {
  const AnimatedAddItemButton({
    super.key,
    required this.addBtnLocation,
    required TextEditingController itemPrice,
    required TextEditingController itemName,
  })  : _itemPrice = itemPrice,
        _itemName = itemName;

  final double addBtnLocation;
  final TextEditingController _itemPrice;
  final TextEditingController _itemName;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      right: MediaQuery.of(context).size.height - addBtnLocation < 100
          ? 10.w
          : null,
      top: MediaQuery.of(context).size.height - addBtnLocation < 100
          ? MediaQuery.of(context).size.height - 50.h
          : addBtnLocation,
      child: ZoomIn(
        delay: const Duration(seconds: 3),
        child: InkWell(
          onTap: () {
            showGeneralDialog(
              pageBuilder: (context, animation, secondaryAnimation) {
                return Container();
              },
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                return StatefulBuilder(builder: (context, setState) {
                  return Transform.scale(
                    scale: animation.value,
                    child: SizedBox(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        content: SizedBox(
                            width: 200.w,
                            height: 200.h,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: const Icon(Icons.close)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AutoSizeText(
                                      "Item name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height: 35.h,
                                        child: CustomTextField(
                                          onChanged: (p0) {
                                            if (_itemPrice.text.isNotEmpty) {
                                              setState(() {});
                                            }
                                          },
                                          textEditingController: _itemName,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AutoSizeText(
                                      "Item Price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height: 30.h,
                                        child: CustomTextField(
                                          onChanged: (p0) {
                                            if (_itemName.text.isNotEmpty) {
                                              setState(() {});
                                            }
                                          },
                                          textEditingController: _itemPrice,
                                          textInputType: TextInputType.number,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ))
                                  ],
                                ),
                                const Spacer(),
                                _itemName.text.isNotEmpty &&
                                        _itemPrice.text.isNotEmpty
                                    ? SaveItemsButton(
                                        item: Items(
                                            itemName: _itemName.text,
                                            itemPrice: double.tryParse(
                                                    _itemPrice.text) ??
                                                0.0,
                                            itemQuantity: 0),
                                      )
                                    : Container()
                              ],
                            )),
                      ),
                    ),
                  );
                });
              },
              barrierDismissible: false,
              context: context,
            ).then((value) {
              _itemName.clear();
              _itemPrice.clear();
            });
          },
          child: SizedBox(
              width: 45.w,
              height: 45.h,
              child: Image.asset("assets/images/addIcon.png",
                  color: Colors.white)),
        ),
      ),
    );
  }
}
