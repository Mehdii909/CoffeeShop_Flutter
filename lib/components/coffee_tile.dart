import "package:flutter/material.dart";

import "../models/cart_item.dart";
import "../models/coffee.dart";
import "../models/coffee_shop.dart";

class CoffeeTile extends StatelessWidget {
  final dynamic item;
  void Function()? onPressed;
  final Widget icon;
  final int? quantity; // optional parameter for quantity

  CoffeeTile({
    super.key,
    required this.item,
    required this.onPressed,
    required this.icon,
    this.quantity, // Initialize quantity with null
  });
  
  @override
  Widget build(BuildContext context) {
    String name = '';
    String price = '';
    String imagePath = '';

    // Check the type of the item and extract relevant information
    if (item is Coffee) {
      name = item.name;
      price = item.price;
      imagePath = item.imagePath;
    } else if (item is CartItem) {
      name = item.coffee.name;
      price = item.coffee.price;
      imagePath = item.coffee.imagePath;
    }

    return Container(
      decoration: BoxDecoration(color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text('${name}${quantity != null ? ' x$quantity' : ''}'),
        subtitle: Text(price),
        leading: Image.asset(imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
          ),
      ),
    );

  }
  
}
