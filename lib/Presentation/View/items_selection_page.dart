import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Core/Shared/custom_text_field.dart';
import 'package:ordering_system/Model/items.dart';
import 'package:ordering_system/ViewModel/iterms_services.dart';
import 'package:provider/provider.dart';
import '../widgets/save_items_button.dart';

class ItemsSelectionPage extends StatefulWidget {
  const ItemsSelectionPage({super.key});

  @override
  State<ItemsSelectionPage> createState() => _ItemsSelectionPageState();
}

class _ItemsSelectionPageState extends State<ItemsSelectionPage> {
  bool showItems = false;
  showItemsMethods() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          showItems = true;
        });
      },
    );
  }

  @override
  void initState() {
    showItemsMethods();
    super.initState();
  }

  final TextEditingController _itemName = TextEditingController();
  final TextEditingController _itemPrice = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Form(
        key: formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<ItemServices>(
                builder: (context, value, _) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return CircleAvatar(
                          child: AutoSizeText(value.items[index].itemName),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Padding(padding: EdgeInsets.all(10)),
                      itemCount: value.items.length);
                },
              ),
              AnimatedPositioned(
                bottom: showItems ? 650.h : 300.h,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: ZoomIn(
                    child: AutoSizeText(
                  "Lets start by adding the items you want in this order",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
              ZoomIn(
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
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              child: const Icon(Icons.close)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const AutoSizeText(
                                              "Item name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                                height: 30.h,
                                                child: CustomTextField(
                                                  onChanged: (p0) {
                                                    if (_itemPrice
                                                        .text.isNotEmpty) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  textEditingController:
                                                      _itemName,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    if (_itemName
                                                        .text.isNotEmpty) {
                                                      setState(() {});
                                                    }
                                                  },
                                                  textEditingController:
                                                      _itemPrice,
                                                  textInputType:
                                                      TextInputType.number,
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
                    );
                  },
                  child: SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: Image.asset("assets/images/addIcon.png",
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
