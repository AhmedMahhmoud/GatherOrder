import 'package:flutter/widgets.dart';

class AppServices extends ChangeNotifier {
  bool beginApp = false;
  startOrder() {
    beginApp = true;
    notifyListeners();
  }
}
