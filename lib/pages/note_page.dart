import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee_add_provider.dart';
import 'package:madcamp_week2/model/coffee_model.dart';
import 'package:madcamp_week2/model/coffee_note.dart';
import 'package:madcamp_week2/model/coffee_note_model.dart';
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



  bool selectedFloral = false;
  bool selectedFruit = false;
  bool selectedBerry = false;
  bool selectedChocolate = false;
  bool selectedNut = false;
  bool selectedCereal = false;


  double sweetValue = 0.0;
  double sourValue = 0.0;
  double bitterValue = 0.0;
  double bodyValue = 0.0;

  double scoreValue = 50;

  @override
  Widget build(BuildContext context) {
    final coffeeNoteProvider = Provider.of<CoffeeNoteModel>(context);
    final coffeeProvider = Provider.of<CoffeeModel>(context);
    final coffeeAddProvider = Provider.of<CoffeeAddProvider>(context);
    final userProvider = Provider.of<UserController>(context);
    
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:15),
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

            SizedBox(height: 5,),
            Container(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor.textColor,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectCoffeePage()),
                  );
                },
                child: Text(coffeeAddProvider.selectedCofffeeID == ''?'커피 선택하기':coffeeAddProvider.selectedCoffeeName, style: TextStyle(color: myColor.cardColor),),
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
                  selected: selectedFloral,
                  iconTheme: IconThemeData(
                    color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedFloral = !selectedFloral;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedFloral? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('과일'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedFruit,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedFruit = !selectedFruit;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedFruit? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('베리'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedBerry,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedBerry = !selectedBerry;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedBerry? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('견과류'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedNut,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedNut =!selectedNut;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedNut? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('초콜릿'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedChocolate,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedChocolate = !selectedChocolate;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedChocolate? myColor.cardColor:myColor.textColor,
                  ),
                ),
                ChoiceChip(
                  label: Text('시리얼'),
                  selectedColor: myColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  // disabledColor: myColor.barColor,
                  backgroundColor: myColor.cardColor,
                  checkmarkColor: myColor.cardColor,
                  selected: selectedCereal,
                  iconTheme: IconThemeData(
                      color: Colors.red
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedCereal = !selectedCereal;
                    });
                  },
                  labelStyle: TextStyle(
                    color:selectedCereal? myColor.cardColor:myColor.textColor,
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
                          onChanged: (value) => setState(() => sweetValue = value),
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
                          onChanged: (value) => setState(() => sourValue = value),
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
                          onChanged: (value) => setState(() => bitterValue = value),
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
                          onChanged: (value) => setState(() => bodyValue = value),
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
                      onPressed: () async{

                        FocusScope.of(context).requestFocus(new FocusNode());

                        if(coffeeAddProvider.selectedCofffeeID == ''){
                          Fluttertoast.showToast(
                              msg: "커피를 선택하여 주세요",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          return;
                        }


                        if (_formKey.currentState!.validate()) {
                          CoffeeNote newCoffeeNote = CoffeeNote(
                              id: "0",
                              written_id: userProvider.profileInfo!.id,
                              coffee_id: coffeeAddProvider.selectedCofffeeID,
                              note_floral: selectedFloral,
                              note_fruit: selectedFruit,
                              note_berry: selectedBerry,
                              note_nut: selectedNut,
                              note_choco: selectedChocolate,
                              note_cereal: selectedCereal,
                              taste_sweet: sweetValue.toInt(),
                              taste_sour: sourValue.toInt(),
                              taste_bitter: bitterValue.toInt(),
                              taste_body: bodyValue.toInt(),
                              overall_score: scoreValue.toInt(),
                              feeling: _feelingController.text
                          );

                          bool write = await coffeeNoteProvider.createCoffeeNote(newCoffeeNote);

                          if (write){
                            Fluttertoast.showToast(
                                msg: "커핑 노트 작성이 완료 되었습니다",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: myColor.mainColor,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );

                            _feelingController.clear();
                            selectedFloral = false;
                            selectedFruit = false;
                            selectedBerry = false;
                            selectedNut = false;
                            selectedChocolate = false;
                            selectedCereal = false;
                            coffeeAddProvider.initialCoffee();
                            coffeeProvider.addCoffeeNote(coffeeAddProvider.selectedCofffeeID, coffeeNoteProvider.coffee_note_lst[coffeeNoteProvider.coffee_note_lst.length-1].id);



                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "커핑 노트 작성에 실패하였습니다",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        }
                      },
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
