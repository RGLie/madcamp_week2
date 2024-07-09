import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee_note_model.dart';
import 'package:madcamp_week2/providers/user_provider.dart';
import 'package:madcamp_week2/widget/my_review_card.dart';
import 'package:provider/provider.dart';


class MyReviewPage extends StatefulWidget {
  const MyReviewPage({super.key});

  @override
  State<MyReviewPage> createState() => _MyReviewPageState();
}

class _MyReviewPageState extends State<MyReviewPage> {
  List<Widget> review_widgets = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dynamic coffeeNoteProvier = Provider.of<CoffeeNoteModel>(context, listen: false);
      dynamic coffeeUser = Provider.of<UserController>(context, listen: false);

      for(int i = 0; i < coffeeNoteProvier.coffee_note_lst.length; i++){
        if(coffeeNoteProvier.coffee_note_lst[i].written_id == coffeeUser.coffeeUser.id){
          review_widgets.add(
              MyReviewCard(
                coffee_id: coffeeNoteProvier.coffee_note_lst[i].coffee_id,
                note_floral: coffeeNoteProvier.coffee_note_lst[i].note_floral,
                note_fruit: coffeeNoteProvier.coffee_note_lst[i].note_fruit,
                note_berry: coffeeNoteProvier.coffee_note_lst[i].note_berry,
                note_nut: coffeeNoteProvier.coffee_note_lst[i].note_nut,
                note_choco: coffeeNoteProvier.coffee_note_lst[i].note_choco,
                note_cereal: coffeeNoteProvier.coffee_note_lst[i].note_cereal,
                taste_sweet: coffeeNoteProvier.coffee_note_lst[i].taste_sweet,
                taste_sour: coffeeNoteProvier.coffee_note_lst[i].taste_sour,
                taste_bitter: coffeeNoteProvier.coffee_note_lst[i].taste_bitter,
                taste_body: coffeeNoteProvier.coffee_note_lst[i].taste_body,
                overall_score: coffeeNoteProvier.coffee_note_lst[i].overall_score,
                feeling: coffeeNoteProvier.coffee_note_lst[i].feeling,
              )
          );

          review_widgets.add(
            SizedBox(height: 15,),
          );
        }
      }

    });

  }


  @override
  Widget build(BuildContext context) {
    // final coffeeNoteProvier = Provider.of<CoffeeNoteModel>(context);


    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/bean.png',
                  width: 45,
                ),
                SizedBox(width: 5,),
                Text(
                  '나의 커핑 노트',
                  style: TextStyle(color: myColor.textColor, fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            if(true)...review_widgets

            //
            // SizedBox(height: 15,),
            // MyReviewCard(),
            // SizedBox(height: 15,),
            // MyReviewCard(),
            // SizedBox(height: 15,),
            // MyReviewCard(),
            //
            //
            // SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }
}
