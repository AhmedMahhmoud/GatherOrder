import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ordering_system/Model/items.dart';

class ItemCard extends StatelessWidget {
  final Items items;
  const ItemCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: DefaultTextStyle(
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 70.w,
              child: Text(
                items.itemName,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 20.w,
              child: Center(
                child: Text(
                  items.itemQuantity.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              child: Text(
                items.itemPrice.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
