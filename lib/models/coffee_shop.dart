import 'package:coffeeshop_flutter/models/coffee.dart';
import 'package:flutter/material.dart';

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
 List<Coffee> _userCart = []; //empty at the beginning 

//get coffee list 
 List<Coffee> get coffeeShop => _shop;

//get user cart 
List<Coffee> get userCart => _userCart;

//add item to cart 
void addItemToCart(Coffee coffee) {
  _userCart.add(coffee);
  notifyListeners();
}

//remove item from cart 
void removeItemFromCart(Coffee coffee){
  _userCart.remove(coffee);
  notifyListeners();
}

}