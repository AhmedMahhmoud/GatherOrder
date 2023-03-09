import 'package:ordering_system/Model/items.dart';

class Order {
  List<Items>? items = [];
  double? totalAmount;
  Order({required this.items, this.totalAmount});
  addNewItem() {}
}
