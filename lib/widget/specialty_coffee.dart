import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';
import 'package:madcamp_week2/widget/tag_buttons.dart';

class SpecialtyCoffee extends StatefulWidget {
  const SpecialtyCoffee({super.key});

  @override
  State<SpecialtyCoffee> createState() => _SpecialtyCoffeeState();
}

class _SpecialtyCoffeeState extends State<SpecialtyCoffee> {
  int nationFilter = 0;
  bool _nation = false;
  bool _farm = false;
  bool _process = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                splashColor: myColor.background,
                onTap: (){
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          //Dialog Main Title
                          title: Column(
                            children: <Widget>[
                              new Text(
                                "국가 선택",
                                style:
                                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          content: SizedBox(
                              height: 250,
                              width: 300,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _nation = !_nation;
                                  });

                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: myColor.textColor,
                                ),
                              )
                          ),
                          actions: <Widget>[
                            new ElevatedButton(
                              child: new Text("닫기", style: TextStyle(color: myColor.cardColor),),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: myColor.mainColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });


                },
                child: TagButton(
                  label: '국가',
                  isSelected: _nation,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(
                splashColor: myColor.background,
                onTap: (){

                  setState(() {
                    _farm = !_farm;
                  });
                },
                child: TagButton(
                  label: '농장',
                  isSelected: _farm,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(
                splashColor: myColor.background,
                onTap: (){
                  setState(() {
                    _process = !_process;
                  });
                },
                child: TagButton(
                  label: '가공방식',
                  isSelected: _process,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CoffeeSelectCard(
            img: 'assets/bean.png',
            name: '에티오피아 예가체프 G2',
            eng_name: 'Ethiopian Yirgacheffe G2',
          )
        ],
      ),
    );
  }
}
