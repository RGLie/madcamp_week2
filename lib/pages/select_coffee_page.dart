import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/widget/specialty_coffee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectCoffeePage extends StatefulWidget {
  const SelectCoffeePage({super.key});

  @override
  State<SelectCoffeePage> createState() => _SelectCoffeePageState();
}

class _SelectCoffeePageState extends State<SelectCoffeePage> {
  int selectedCoffee = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor.background,
        foregroundColor: myColor.textColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 43,
                ),
                SizedBox(width: 5,),
                Text(
                  '어떤 커피를 드셨나요?',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),

            // SizedBox(
            //   height: 15,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      selectedCoffee -= 1;
                    });

                  },
                  icon: Icon(Icons.arrow_back_ios_outlined)
                ),

                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 190,
                      height:190,
                      decoration: BoxDecoration(
                        color: myColor.lightColor,
                        borderRadius: BorderRadius.all(Radius.circular(95)),
                      ),
                    ),
                    Image.asset(
                      selectedCoffee%3==0?'assets/special.png':selectedCoffee%3==1?'assets/franchise.png':'assets/etc.png',
                      width: 260,
                    )
                  ],
                ),

                IconButton(
                    onPressed: (){
                      setState(() {
                        selectedCoffee += 1;
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined)
                ),
              ],
            ),
            Text(selectedCoffee%3==0?'스페셜티 커피':selectedCoffee%3==1?'프랜차이즈 커피':'기타 커피',
              style: TextStyle(fontSize: 20, color: myColor.textColor, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20,),


            AnimatedSmoothIndicator(
              activeIndex: selectedCoffee%3,
              count: 3,
              effect: WormEffect(
                activeDotColor: myColor.mainColor,
                dotColor: Color(0xFFBBBBBB),
                dotWidth: 12,
                dotHeight: 12,

              ),
            ),

            SizedBox(height: 25,),
            SpecialtyCoffee()





          ],
        ),
      ),
    );
  }
}
