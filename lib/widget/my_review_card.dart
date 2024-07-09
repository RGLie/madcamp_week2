import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee.dart';
import 'package:madcamp_week2/model/coffee_model.dart';
import 'package:madcamp_week2/pages/coffee_detail_page.dart';
import 'package:provider/provider.dart';


class MyReviewCard extends StatefulWidget {
  String coffee_id;
  bool note_floral;
  bool note_fruit;
  bool note_berry;
  bool note_nut;
  bool note_choco;
  bool note_cereal;
  int taste_sweet;
  int taste_sour;
  int taste_bitter;
  int taste_body;
  int overall_score;
  String feeling;

  MyReviewCard({super.key,
    required this.coffee_id,
    required this.note_floral,
    required this.note_fruit,
    required this.note_berry,
    required this.note_nut,
    required this.note_choco,
    required this.note_cereal,
    required this.taste_sweet,
    required this.taste_sour,
    required this.taste_bitter,
    required this.taste_body,
    required this.overall_score,
    required this.feeling,
  });

  @override
  State<MyReviewCard> createState() => _MyReviewCardState();
}

class _MyReviewCardState extends State<MyReviewCard> {
  @override
  Widget build(BuildContext context) {
    final coffeeP = Provider.of<CoffeeModel>(context);

    Coffee? mycoffee = null;


    List tags = [];
    if (widget.note_floral){tags.add('플로럴');}
    if (widget.note_fruit){tags.add('과일');}
    if (widget.note_berry){tags.add('베리');}
    if (widget.note_nut){tags.add('견과류');}
    if (widget.note_choco){tags.add('초콜릿');}
    if (widget.note_cereal){tags.add('시리얼');}


    String img_url = '';
    String _script = '';
    String _name = '';
    String _type = '';
    String _name_eng = '';

    for(var i = 0; i<coffeeP.coffee_lst.length; i++){
      if(coffeeP.coffee_lst[i].id == widget.coffee_id){
        mycoffee = coffeeP.coffee_lst[i];
        img_url = coffeeP.coffee_lst[i].img;
        _script = coffeeP.coffee_lst[i].script;
        _name_eng = coffeeP.coffee_lst[i].name_eng;
        _name =  coffeeP.coffee_lst[i].name;
        if(coffeeP.coffee_lst[i].type == "special"){
          _type = '스페셜티 커피';
        }
        else if(coffeeP.coffee_lst[i].type == "franchise"){
          _type = '프랜차이즈 커피';
        }
        else if(coffeeP.coffee_lst[i].type == "etc"){
          _type = '기타 커피';
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
                  builder: (context) => CoffeeDetailPage(coffee: mycoffee!,)));
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
                    img_url,
                    width: 80,
                  ),

                  SizedBox(width: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(_type,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:13, color: myColor.textColor),
                      ),
                      SizedBox(height: 5,),
                      Text(_name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:18, color: Colors.black),
                      ),
                      Text(_name_eng,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:14, color: Color(0xFF5E5E5E)),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(height: 30,),

              Text(widget.feeling,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:18, color: Colors.black),
              ),
              SizedBox(height: 10,),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags.map((tag) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 4, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffdddddd),
                      borderRadius:
                      BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: myColor.mainColor),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 15,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.overall_score.toString(),
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
                          Text(widget.taste_sweet.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                        ],
                      ),
                      Row(
                        children: [
                          Text('산미', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                          SizedBox(width: 5,),
                          Text(widget.taste_sour.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
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
                          Text(widget.taste_bitter.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                        ],
                      ),
                      Row(
                        children: [
                          Text('바디', style: TextStyle(fontWeight: FontWeight.bold, fontSize:12, color: myColor.grayA,)),
                          SizedBox(width: 5,),
                          Text(widget.taste_body.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize:14,))
                        ],
                      ),
                    ],
                  )



                ],
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
