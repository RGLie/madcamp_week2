import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/widget/review_card.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 300),
      length: 4,
      child: Column(
        children: [
          Container(
            color: myColor.cardColor,
            child: TabBar(
              indicatorColor: myColor.mainColor,

              unselectedLabelColor: Color(0xFF777777),
              tabAlignment: TabAlignment.fill,
              labelStyle: TextStyle(
                  color: myColor.mainColor,
                  fontWeight: FontWeight.bold,

                  fontSize: 13),
              indicatorWeight: 3,
                tabs: [
                  Tab(
                    text: '전체',
                    height: 50,
                  ),
                  Tab(
                    text: '스페셜티',
                    height: 50,
                  ),
                  Tab(
                    text: '프렌차이즈',
                    height: 50,
                  ),
                  Tab(
                    text: '기타',
                    height: 50,
                  ),
                ]
            ),
          ),
          SizedBox(height: 15,),

          Row(
            children: [
              SizedBox(width: 15,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor.cardColor,
                    surfaceTintColor: myColor.cardColor,
                  ),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCoffeePage()));

                  },
                  child: Text('필터', style: TextStyle(color: myColor.textColor),),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor.cardColor,
                    surfaceTintColor: myColor.cardColor,
                  ),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCoffeePage()));

                  },
                  child: Text('정렬', style: TextStyle(color: myColor.textColor),),
                ),
              ),
              SizedBox(width: 15,),
            ],
          ),
          // SizedBox(height: 15,),


          Expanded(
            child: TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          ReviewCard(),
                          SizedBox(height: 20,)
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          ReviewCard(),
                          SizedBox(height: 20,)
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          ReviewCard(),
                          SizedBox(height: 20,)
                        ],
                      );
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          ReviewCard(),
                          SizedBox(height: 20,)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
