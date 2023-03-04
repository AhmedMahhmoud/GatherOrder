import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordering_system/Core/ColorManager/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Presentation/View/home.dart';
import 'package:ordering_system/ViewModel/items/iterms_services.dart';
import 'package:provider/provider.dart';
import '../widgets/animated_add_item_button.dart';
import '../widgets/display_added_items_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    final addBtnLocation = MediaQuery.of(context).size.height / 2 +
        (Provider.of<ItemServices>(context).items.length * 20) +
        0;
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
              const DisplayAddedItems(),
              AnimatedPositioned(
                bottom: showItems ? 620.h : 300.h,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: ZoomIn(
                    child: Column(
                  children: [
                    AutoSizeText(
                      "Lets start by adding the items in the order",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (Provider.of<ItemServices>(context)
                        .items
                        .isNotEmpty) ...[
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            )),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: AppColors.greyColor)),
                          child: const Icon(
                            semanticLabel: 'Save',
                            FontAwesomeIcons.floppyDisk,
                            color: AppColors.greyColor,
                          ),
                        ),
                      )
                    ]
                  ],
                )),
              ),
              AnimatedAddItemButton(
                  addBtnLocation: addBtnLocation,
                  itemPrice: _itemPrice,
                  itemName: _itemName),
            ],
          ),
        ),
      ),
    );
  }
}
