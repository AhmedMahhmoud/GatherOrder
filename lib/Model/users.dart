import 'items.dart';

class User {
  final int id;
  final String name;
  final List<Items>? items;
  final double? totalPriceRequired;
  final double? payedAmount;
  final double? reminderAmount;

  User(
      {required this.name,
      this.items,
      required this.id,
      this.totalPriceRequired,
      this.payedAmount,
      this.reminderAmount});
}
