import 'package:coffeeshop_flutter/models/coffee.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    //black coffee 
    Coffee(
      name: 'Long Black',
      price: '3.5 TND',
      imagePath: 'lib/images/black.png',
    ),
    //espresso coffee
       Coffee(
      name: 'Espresso',
      price: '2.5 TND',
      imagePath: 'lib/images/espresso.png',
    ),
    //armatura coffee
       Coffee(
      name: 'Armatura',
      price: '4 TND',
      imagePath: 'lib/images/armatura.png',
    ),
    //latte coffee
       Coffee(
      name: 'Latte',
      price: '4.5 TND',
      imagePath: 'lib/images/latte.png',
    ),
    //iced coffee
       Coffee(
      name: 'Iced Coffee',
      price: '5 TND',
      imagePath: 'lib/images/iced_coffee.png',
    ),
  
  ];

  //user cart
  final List<CartItem> _userCart = []; //empty at the beginning

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<CartItem> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    // Check if the coffee is already in the cart
    for (CartItem cartItem in _userCart) {
      if (cartItem.coffee == coffee) {
        // If yes, just increase the quantity
        cartItem.quantity++;
        notifyListeners();
        return;
      }
    }

    // If not, add a new item to the cart
    _userCart.add(CartItem(coffee: coffee, quantity: 1));
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    for (CartItem cartItem in _userCart) {
      if (cartItem.coffee == coffee) {
        if (cartItem.quantity > 1) {
          // If the quantity is more than 1, decrease it
          cartItem.quantity--;
        } else {
          // If the quantity is 1, remove the entire item
          _userCart.remove(cartItem);
        }
        notifyListeners();
        return;
      }
    }
  }

  //calculate total
  double calculateTotal() {
    double total = 0.0;
    for (CartItem cartItem in _userCart) {
      List<String> parts = cartItem.coffee.price.split(' ');
      double price = double.parse(parts[0]);
      total += price * cartItem.quantity;
    }
    return total;
  }

}
