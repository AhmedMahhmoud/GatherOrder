import 'package:flutter/material.dart';
import 'package:ordering_system/Model/items.dart';
import 'package:ordering_system/Model/order.dart';

import '../Model/users.dart';

class UsersServices extends ChangeNotifier {
  List<User> users = [];

  createListOfUsers(int lengthOfUser) {
    users.clear();
    for (int i = 0; i <= lengthOfUser; i++) {
      users.add(User(name: '', order: Order(items: [], totalAmount: 0), id: i));
    }
  }

  addUsers(Items item, int index) {
    users[index].order.items!.add(item);
    notifyListeners();
  }
}
