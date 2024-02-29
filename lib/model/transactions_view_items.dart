import 'package:flutter/material.dart';

class TransactionViewItems {
  TransactionViewItems({
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.desc,
    required this.price,
  });

  Icon icon;
  Color iconColor;
  String name;
  String desc;
  String price;
}
