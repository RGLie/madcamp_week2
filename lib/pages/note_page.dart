import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/test_model.dart';
import 'package:madcamp_week2/pages/select_coffee_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _feelingController = TextEditingController();



  int selectedFloral = 0;
  int selectedFruit = 0;
  int selectedBerry = 0;
  int selectedChocolate = 0;
  int selectedNut = 0;
  int selectedCereal = 0;


  double currentValue = 0.0;
  double scoreValue = 50;

  @override
  Widget build(BuildContext context) {
    final planners = Provider.of<HumanModel>(context);
    final userProvider = Provider.of<UserController>(context);
    
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '안녕하세요, ${userProvider.profileInfo?.properties.nickname.toString()} 님!',
              style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10,),

            Container(
              width: double.maxFinite,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 280,
                    height:280,
                    decoration: BoxDecoration(
                      color: myColor.lightColor,
                      borderRadius: BorderRadius.all(Radius.circular(150)),
                    ),
                  ),
                  Image.asset(
                    'assets/main.png',
                    width: 300,
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 35,
                ),
                SizedBox(width: 5,),
                Text(
                  '어떤 커피를 드셨나요?',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('커피를 선택해주세요', style: TextStyle(color: myColor.grayA),),
                if(planners.human_lst.length>0)...[
                  Text(planners.human_lst[3].name)
                ]
              ],
            ),
            SizedBox(height: 5,),
            Container(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor.textColor,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCoffeePage()));
                  planners.loadHuman();

                },
                child: Text('커피 선택하기', style: TextStyle(color: myColor.cardColor),),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 35,
                ),
                SizedBox(width: 5,),
                Text(
                  '테이스팅 노트를 작성해주세요!',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 6,
              runSpacing: 6,
              children: [
                ChoiceChip(
                  label: Text('플로럴'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedFloral ==1,
                  iconTheme: IconThemeData(
                    color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedFloral = (selectedFloral+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedFloral ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('과일'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedFruit ==1,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedFruit = (selectedFruit+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedFruit ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('베리'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedBerry ==1,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedBerry = (selectedBerry+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedBerry ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('견과류'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedNut ==1,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedNut = (selectedNut+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedNut ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('초콜릿'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedChocolate ==1,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedChocolate = (selectedChocolate+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedChocolate ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('시리얼'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedCereal ==1,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedCereal = (selectedCereal+1)%2;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedCereal ==1? myColor.cardColor:myColor.textColor,
                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 35,
                ),
                SizedBox(width: 5,),
                Text(
                  '테이스팅 맵을 작성해주세요!',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('단맛', style: TextStyle(fontSize: 16, color: myColor.mainColor, fontWeight: FontWeight.bold),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: InteractiveSlider(
                          initialProgress: 0.3,
                          backgroundColor: myColor.cardColor,
                          foregroundColor: myColor.barColor,
                          unfocusedOpacity: 1,
                          min: 0.0,
                          max: 100.0,
                          onChanged: (value) {
                            // print(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('산미', style: TextStyle(fontSize: 16, color: myColor.mainColor, fontWeight: FontWeight.bold),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: InteractiveSlider(
                          initialProgress: 0.3,
                          backgroundColor: myColor.cardColor,
                          foregroundColor: myColor.barColor,
                          unfocusedOpacity: 1,
                          min: 0.0,
                          max: 100.0,
                          onChanged: (value) => setState(() => currentValue = value),
                        ),
                      )
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('쓴맛', style: TextStyle(fontSize: 16, color: myColor.mainColor, fontWeight: FontWeight.bold),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: InteractiveSlider(
                          initialProgress: 0.3,
                          backgroundColor: myColor.cardColor,
                          foregroundColor: myColor.barColor,
                          unfocusedOpacity: 1,
                          min: 0.0,
                          max: 100.0,
                          onChanged: (value) => setState(() => currentValue = value),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('바디감', style: TextStyle(fontSize: 16, color: myColor.mainColor, fontWeight: FontWeight.bold),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: InteractiveSlider(
                          initialProgress: 0.3,
                          backgroundColor: myColor.cardColor,
                          foregroundColor: myColor.barColor,
                          unfocusedOpacity: 1,
                          min: 0.0,
                          max: 100.0,
                          onChanged: (value) => setState(() => currentValue = value),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('로스팅', style: TextStyle(fontSize: 16, color: myColor.mainColor, fontWeight: FontWeight.bold),),
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child: InteractiveSlider(
                          initialProgress: 0.3,
                          backgroundColor: myColor.cardColor,
                          foregroundColor: myColor.barColor,
                          unfocusedOpacity: 1,
                          min: 0.0,
                          max: 100.0,
                          onChanged: (value) => setState(() => currentValue = value),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),


            SizedBox(height: 30,),
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 35,
                ),
                SizedBox(width: 5,),
                Text(
                  '점수를 매겨주세요!',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(scoreValue.toInt().toString(),
                  style: TextStyle(
                    color: myColor.textColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.1
                  ),
                ),
                Text('점',
                  style: TextStyle(
                      color: myColor.textColor
                  ),
                )
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: InteractiveSlider(
                    initialProgress: 0.5,
                    backgroundColor: myColor.cardColor,
                    foregroundColor: myColor.barColor,
                    unfocusedOpacity: 1,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (value) => setState(() => scoreValue = value),
                  ),
                )
              ],
            ),



            SizedBox(height: 30,),
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 35,
                ),
                SizedBox(width: 5,),
                Text(
                  '한 줄 평을 남겨주세요!',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10,),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _feelingController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.multiline,
                    cursorColor: myColor.mainColor,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.format_quote_outlined),
                        prefixIcon: Icon(Icons.format_quote_outlined),
                        // icon: Icon(Icons.note_add_outlined),
                        fillColor: myColor.cardColor,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide:
                          BorderSide(color: myColor.cardColor, width: 0),
                        ),
                        // helperText: '',
                        hintText: '한 줄 평을 입력하세요',
                        floatingLabelStyle: TextStyle(color: myColor.mainColor),
                        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                        labelText: '한 줄 평',
                        labelStyle: TextStyle(fontSize: 12,  color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                              color: myColor.mainColor, width: 3),
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "내용을 입력해주세요";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),

                  Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myColor.textColor,
                      ),
                      onPressed: (){},
                      child: Text('작성 완료', style: TextStyle(color: myColor.cardColor),),
                    ),
                  ),



                ],
              ),
            ),
            


            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
