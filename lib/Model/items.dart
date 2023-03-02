import 'package:equatable/equatable.dart';

class Items extends Equatable {
  String itemName;
  double itemPrice;
  int itemQuantity;

  Items(
      {required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});

  @override
  List<Object?> get props => [itemName, itemPrice, itemQuantity];
}
