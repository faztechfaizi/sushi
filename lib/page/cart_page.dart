

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeCart(Food food, BuildContext context){
    final shop = context.read <Shop>();
    shop.removeCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(title: const Text('My Cart'),
        backgroundColor: primaryColor,
        elevation: 0,
        ),
        body: Column(
          children: [
          Expanded(
              child: ListView.builder( itemCount: value.cart.length,
              itemBuilder: (context, index)  {
                
            
                final Food food = value.cart[index];
            
                final String foodName = food.name;
                final String foodPrice = food.price;
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor, 
                  ),
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child: ListTile(
                    title: Text(foodName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text(foodPrice,style: const TextStyle(color: Colors.white),),
                    trailing: IconButton(onPressed: (){
                      removeCart(food, context);
                    }, 
                    icon: Icon(Icons.delete,color: Colors.grey[300],),),
                    
                
                
                  ),
                );
            
            
                
              } ,),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(text: 'Pay Now',onTap: () {
                
              },),
            )
          ],
        ),
        
    
      ),
    );
  }
}