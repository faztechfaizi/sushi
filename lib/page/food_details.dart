import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/themes/colors.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 0;
  void decrementQuantity (){
    setState(() {
      if(quantityCount > 0 ){
        quantityCount--;
      }
    });
  }

  void incrementQuantity (){
    setState(() {
      quantityCount++;
    });
  }

  void addTocart(){
    if (quantityCount > 0 ){
      final shop = context.read <Shop>();
      shop.addTocart(widget.food, quantityCount);
      showDialog(context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: secondaryColor,
        content: Text('Sucessfully added to cart ',style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.done,color: Colors.white,)),

        ],

      ),
      );
    }


  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.food.ratings),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Dive into the world of authentic Japanese cuisine with our apps original sushi collection. Immerse yourself in the art of perfectly crafted sushi, where vinegared rice meets the freshest seafood, vibrant vegetables, and delightful flavors. Explore a variety of traditional styles, from hand-pressed Nigiri to elegantly rolled Maki. Elevate your dining adventure by discovering the harmony of tastes, all conveniently at your fingertips. Download now to embark on a culinary journey that combines tradition, innovation, and the exquisite essence of original sushi.',
                  style: TextStyle(
                      color: Colors.grey[800], fontSize: 14, height: 1.5),
                ),


              ],
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            color: primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('\$${widget.food.price}',
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: secondaryColor,shape: BoxShape.circle),
                        child: IconButton(onPressed: decrementQuantity, 
                        icon: Icon(Icons.remove,color: Colors.white,),),
                        
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(quantityCount.toString(),style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: secondaryColor,shape: BoxShape.circle),
                        child: IconButton(onPressed: incrementQuantity, 
                        icon: Icon(Icons.add,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                  



                ],
                ),
                const SizedBox(height: 25,),
                MyButton(text: 'Add to Cart', onTap: addTocart,)

              ],
            ),
          )
        ],
      ),
    );
  }
}
