import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  final String image;
  final String size;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    required this.quantity,
  });
}

List<CartItem> cartList = []; // Define your cartList to hold CartItem objects
