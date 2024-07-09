import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee.dart';
import 'package:madcamp_week2/pages/coffee_detail_page.dart';
import 'package:provider/provider.dart';

import '../model/coffee_note_model.dart';


class ReviewCard extends StatefulWidget {
  Coffee coffee;

  ReviewCard({super.key,
    required this.coffee
  });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    final coffeeNoteProvider = Provider.of<CoffeeNoteModel>(context);

    int score = 0;

    for(var i = 0; i<widget.coffee.review_lst.length; i++){
      for(var j =0; j<coffeeNoteProvider.coffee_note_lst.length;j++){
        if(coffeeNoteProvider.coffee_note_lst[j].id == widget.coffee.review_lst[i]){
          score += coffeeNoteProvider.coffee_note_lst[j].overall_score;
        }
      }
    }


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
                  builder: (context) => CoffeeDetailPage(coffee: widget.coffee)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    widget.coffee.img,
                    width: 100,
                  ),

                  SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.coffee.review_lst.length==0?' - ':(score/widget.coffee.review_lst.length).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize:45, color: myColor.textColor, height: 1.0),
                          ),
                          SizedBox(width: 3,),
                          Text('점',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: myColor.textColor),
                          ),
                        ],
                      ),
                      Text('${widget.coffee.review_lst.length}개의 리뷰',
                        style: TextStyle(color: myColor.grayA, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text(widget.coffee.type=='special'?'스페셜티 커피':widget.coffee.type=='franchise'?'프랜차이즈 커피':'기타 커피',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:14, color: myColor.textColor),
              ),
              SizedBox(height: 10,),
              Text(widget.coffee.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: Colors.black),
              ),
              Text(widget.coffee.name_eng,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:16, color: Color(0xFF5E5E5E)),
              ),
              SizedBox(height: 15,),

              Text(widget.coffee.script,
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
