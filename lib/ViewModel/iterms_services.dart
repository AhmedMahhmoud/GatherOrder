import 'package:flutter/material.dart';
import 'package:ordering_system/Core/Shared/shared_methods.dart';

import '../Model/items.dart';

class ItemServices extends ChangeNotifier {
  List<Items> items = [];

  addNewItem(Items item, BuildContext context) {
    if (!items.contains(item)) {
      items.add(item);
      notifyListeners();
    } else {
      displayErrorToast(context, "Item already exists");
    }
  }
}
