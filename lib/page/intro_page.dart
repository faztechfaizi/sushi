import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 69, 74),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 30,),
            Text('SUSHIMAN',style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,color: Colors.white
            ),),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset('assets/images/sushi1.png',),
              

            ),

            const SizedBox(height: 25,),

            Text('THE TASTE OF JAPANESE FOOD',style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,color: Colors.white
            ),),
            const SizedBox(
              height: 10,
            ),
            Text('Feel the taste of most populars Japanese food from anywhere and anytime.',
            style: TextStyle(fontSize:16,color: Colors.grey[200],height: 1.5),
            
            textAlign: TextAlign.justify,
            
            ),
            const SizedBox(height: 10,),
           MyButton(text: 'Get Started',
          onTap: (() {
            Navigator.pushNamed(context, '/menupage');
          }),)

            
          ],
        ),
      ),
    );
  }
}