import 'items.dart';

class User {
  final String name;
  final List<Items>? items;
  final double? totalPriceRequired;
  final double? payedAmount;
  final double? reminderAmount;

  User(
      {required this.name,
      this.items,
      this.totalPriceRequired,
      this.payedAmount,
      this.reminderAmount});
}
