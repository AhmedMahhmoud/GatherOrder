import 'package:flutter/material.dart';
import 'package:ordering_system/Core/Shared/shared_methods.dart';
import 'package:ordering_system/ViewModel/items/items_mixins.dart';

import '../../Model/items.dart';

class ItemServices extends ChangeNotifier with ItemsMixin {
  List<Items> items = [];

  bool addNewItem(Items item, BuildContext context) {
    if (!isItemExistInList(items, item)) {
      items.add(item);
      notifyListeners();
      return true;
    } else {
      displayErrorToast(context, "This item already exist");
      return false;
    }
  }

  removeItemByName(String itemName) {
    items.removeWhere((element) => element.itemName == itemName);
    notifyListeners();
  }
}
