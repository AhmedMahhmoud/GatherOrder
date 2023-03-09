import 'package:ordering_system/Model/order.dart';

class User {
  final int id;
  final String name;
  Order order;

  User({
    required this.name,
    required this.order,
    required this.id,
  });
}
