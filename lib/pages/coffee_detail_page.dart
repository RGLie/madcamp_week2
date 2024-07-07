import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/widget/review_card.dart';
import 'package:madcamp_week2/widget/review_detail_card.dart';

class CoffeeDetailPage extends StatefulWidget {
  const CoffeeDetailPage({super.key});

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor.background,
        foregroundColor: myColor.textColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: 250,
                image: AssetImage(
                    'assets/bean.png'
                ),
              ),
              Text('스페셜티 커피',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:14, color: myColor.textColor),
              ),
              SizedBox(height: 10,),
              Text('브라질 옐로우 버본',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: Colors.black),
              ),
              Text('Brazil Yellow Bourbon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:16, color: Color(0xFF5E5E5E)),
              ),
              SizedBox(height: 20,),
              Text('브라질 옐로우 버번은 세하도 지역의 커피로 세하도 지역의 천혜의 자연환경에 특별관리로 수확된 커피입니다. 보통 붉은 색을 띄는 체리와 다르게 노란색을 띄는 옐로우버번 품종은 특유의 열대과일 향미와 달콤한 맛이 일품인 커피입니다.',
                style: TextStyle(fontSize:14, color: myColor.gray3),
              ),
              SizedBox(height: 20,),
          
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: myColor.mainColor
                  ),
                  child: Column(
                    children: [
                      Text('32개의 리뷰',
                        style: TextStyle(color: myColor.cardColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('96.3',
                            style: TextStyle(color: myColor.cardColor, fontWeight: FontWeight.bold, fontSize: 65, height: 1.0),
                          ),
                          Text('/100',
                            style: TextStyle(color: myColor.cardColor, fontWeight: FontWeight.bold, fontSize: 31,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              ReviewDetailCard(),
              SizedBox(
                height: 10,
              ),
              ReviewDetailCard(),
              SizedBox(
                height: 10,
              ),
              ReviewDetailCard(),
              SizedBox(
                height: 10,
              ),

              SizedBox(height: 45,)
          
            ],
          ),
        ),
      ),

    );
  }
}
