import 'package:flutter/material.dart';

import '../Model/users.dart';

class UsersServices extends ChangeNotifier {
  List<User>? users = [];
  addUsers(Map<String, String> usersMap) {
    for (int i = 0; i < usersMap.length; i++) {
      users!.add(User(name: usersMap['$i']!, id: i));
    }
    print(users!.first.id);
    print(users!.first.name);
  }
}
