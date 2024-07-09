import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/pages/coffee_detail_page.dart';


class ReviewDetailCard extends StatefulWidget {
  String img;
  String score;
  String feels;
  String sweet;
  String sour;
  String bitter;
  String body;

  ReviewDetailCard({super.key,
    required this.img,
    required this.score,
    required this.feels,
    required this.sweet,
    required this.sour,
    required this.bitter,
    required this.body,

  });

  @override
  State<ReviewDetailCard> createState() => _ReviewDetailCardState();
}

class _ReviewDetailCardState extends State<ReviewDetailCard> {
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
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ScrumPage(
          //             index: index, tags: arrived_tags)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2),
          child: ListTile(
            // leading: Image.network(
            //   widget.img,
            //   width: 60,
            // ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.feels,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 16,
                      // color: myColor.gray5
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.score.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize:35, color: myColor.textColor, height: 1.0),
                        ),
                        SizedBox(width: 3,),
                        Text('점',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize:15, color: myColor.textColor),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Row(
                          children: [
                            Text('단맛', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                            SizedBox(width: 5,),
                            Text(widget.sweet.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                          ],
                        ),
                        Row(
                          children: [
                            Text('산미', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                            SizedBox(width: 5,),
                            Text(widget.sour.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Row(
                          children: [
                            Text('쓴맛', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                            SizedBox(width: 5,),
                            Text(widget.bitter.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                          ],
                        ),
                        Row(
                          children: [
                            Text('바디', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                            SizedBox(width: 5,),
                            Text(widget.body.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                          ],
                        ),
                      ],
                    )



                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
