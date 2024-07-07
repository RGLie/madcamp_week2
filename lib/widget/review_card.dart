import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/pages/coffee_detail_page.dart';


class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: myColor.cardColor,
      color: myColor.cardColor,
      // margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      elevation: 3, // 카드 하단 그림자 크기
      // shadowColor: Colors.black.withOpacity(0.7),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // splashColor: myColor.background,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CoffeeDetailPage()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    width: 100,
                    image: AssetImage(
                        'assets/bean.png'
                    ),
                  ),

                  SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('96.3',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize:45, color: myColor.textColor, height: 1.0),
                          ),
                          SizedBox(width: 3,),
                          Text('점',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: myColor.textColor),
                          ),
                        ],
                      ),
                      Text('32개의 리뷰',
                        style: TextStyle(color: myColor.grayA, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
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
              SizedBox(height: 15,),

              Text('브라질 옐로우 버번은 세하도 지역의 커피로 세하도 지역의 천혜의 자연환경에 특별관리로 수확된 커피입니다. 보통 붉은 색을 띄는 체리와 다르게 노란색을 띄는 옐로우버번 품종은 특유의 열대과일 향미와 달콤한 맛이 일품인 커피입니다.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize:13, color: myColor.gray3),
              ),


            ],
          ),
          // child: ListTile(
          //   leading: Image(
          //     width: 60,
          //     image: AssetImage(
          //         'assets/bean.png'
          //     ),
          //   ),
          //   title: Text(
          //     'widget.name',
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   subtitle: Text(
          //     'widget.eng_name',
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //         fontSize: 14,
          //         color: myColor.gray5
          //       // fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
