import 'package:ordering_system/Model/items.dart';

mixin ItemsMixin {
  isItemExistInList(List<Items> items, Items incomingItem) {
    if (items
        .where((element) => element.itemName == incomingItem.itemName)
        .toList()
        .isNotEmpty) {
      return true;
    }
    return false;
  }
}
