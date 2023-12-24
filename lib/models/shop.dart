import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier{
 final List <Food> _foodMenu = [
    Food(
      name: 'Orginal Sushi',
      price: '21.00',
      imagePath: 'assets/images/originalsushi.png',
      ratings: '4.5',
    ),
    Food(
      name: 'Shrimp Sushi',
      price: '25.00',
      imagePath: 'assets/images/shrimpsushi.png',
      ratings: '5',
    ),
  ];

  List <Food> _cart = [];

  List <Food> get foodMenu => _foodMenu;
  List <Food> get cart => _cart;

  void addTocart (Food foodItem, int quantity){
    for(int i = 0 ; i < quantity; i++){
      _cart.add(foodItem);
      

    }
    notifyListeners();

  }

  void removeCart(Food food){
    cart.remove(food);
    notifyListeners();

  }



}