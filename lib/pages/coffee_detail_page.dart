import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee.dart';
import 'package:madcamp_week2/widget/review_card.dart';
import 'package:madcamp_week2/widget/review_detail_card.dart';
import 'package:provider/provider.dart';

import '../model/coffee_note_model.dart';

class CoffeeDetailPage extends StatefulWidget {
  Coffee coffee;

  CoffeeDetailPage({super.key,
    required this.coffee,
  });

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  List<Widget> review_widgets = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {




      dynamic coffeeNoteProvier = Provider.of<CoffeeNoteModel>(context, listen: false);
      for(var c=0; c<widget.coffee.review_lst.length; c++){
        for(int i = 0; i < coffeeNoteProvier.coffee_note_lst.length; i++){
          if(coffeeNoteProvier.coffee_note_lst[i].id == widget.coffee.review_lst[c]){
            review_widgets.add(
                ReviewDetailCard(
                    img: "",
                    score: coffeeNoteProvier.coffee_note_lst[i].overall_score,
                    feels: coffeeNoteProvier.coffee_note_lst[i].feeling,
                    sweet: coffeeNoteProvier.coffee_note_lst[i].taste_sweet,
                    sour: coffeeNoteProvier.coffee_note_lst[i].taste_sour,
                    bitter: coffeeNoteProvier.coffee_note_lst[i].taste_bitter,
                    body: coffeeNoteProvier.coffee_note_lst[i].taste_body
                )
            );

            review_widgets.add(
              SizedBox(height: 10,),
            );
          }
        }
      }


    });

  }


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
              Image.network(
                widget.coffee.img,
                width: 250,
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),
              Text(widget.coffee.script,
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
                      Text('${widget.coffee.review_lst.length.toString()}개의 리뷰',
                        style: TextStyle(color: myColor.cardColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.coffee.review_lst.length==0?' - ':(score/widget.coffee.review_lst.length).toString(),
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
              if(true)...review_widgets,

              SizedBox(height: 45,)
          
            ],
          ),
        ),
      ),

    );
  }
}
