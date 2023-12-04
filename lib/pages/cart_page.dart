import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async'; // Importez cette bibliothèque pour utiliser Future et Timer


import '../components/coffee_tile.dart';
import '../models/cart_item.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';
import 'payment.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    //let user know the remove is successful
    showDialog(context: context, builder: (context)=> const AlertDialog(
      title: Text("Successfully removed from cart",
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
    ),);

    // Fermer la boîte de dialogue après un délai (par exemple, 2 secondes)
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Fermer la boîte de dialogue
    });
  }

  void payNow() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Payment()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "Your Cart", 
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    
                //get individual cart items
                CartItem cartItem = value.userCart[index];

                //return the coffee tile
                return CoffeeTile(
                  item: cartItem,
                  onPressed: () => removeFromCart(cartItem.coffee), // Display the quantity
                  icon: Icon(Icons.delete),
                  quantity: cartItem.quantity,
                );
                
              },
                ),
              ),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Proceed payment",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
