import 'package:flutter/widgets.dart';

class AppServices extends ChangeNotifier {
  bool beginApp = false;
  bool usersNumberEntered = false;
  int numberOfUsersEntered = 0;
  startOrder() {
    beginApp = true;
    notifyListeners();
  }

  setNumberOfUsersEntered(users) {
    numberOfUsersEntered = users;
  }

  confirmUserNumberEntered() {
    usersNumberEntered = true;
    notifyListeners();
  }
}
