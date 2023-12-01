import 'package:coffeeshop_flutter/components/coffee_tile.dart';
import 'package:coffeeshop_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget{
  const ShopPage ({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();

}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart 
  void addToCart(Coffee coffee) {

    //add to cart action
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    //let user know the add is successful 
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("Successfully added to cart"),
    ),
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
            // heading message
            const Text("How would you like your coffee ?",
             style: TextStyle(fontSize: 20),
             ),

             const SizedBox(height: 25),

             //list coffees available 
             Expanded(
              child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
              //get indiv coffee
              Coffee eachCoffee = value.coffeeShop[index];



              //return coffee tile
              return CoffeeTile(
                coffee: eachCoffee,
                icon: Icon(Icons.add),
                onPressed: ()=> addToCart(eachCoffee),
                );

             }),
             ),
          ],
          ),
      ),
      ),
    );
  }
}
    
  
