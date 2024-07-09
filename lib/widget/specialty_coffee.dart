import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee_add_provider.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';
import 'package:madcamp_week2/widget/tag_buttons.dart';
import 'package:provider/provider.dart';

import '../model/coffee_model.dart';

class SpecialtyCoffee extends StatefulWidget {
  const SpecialtyCoffee({super.key});

  @override
  State<SpecialtyCoffee> createState() => _SpecialtyCoffeeState();
}

class _SpecialtyCoffeeState extends State<SpecialtyCoffee> {
  List<Widget> special_widgets = [];
  int nationFilter = 0;
  bool _nation = false;
  bool _farm = false;
  bool _process = false;

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeModel>(context);
    final coffeeAddProvider = Provider.of<CoffeeAddProvider>(context);
    // coffeeProvider.loadCoffee();
    int getSpecial = 0;
    // print(coffeeProvider.coffee_lst[0].script);
    for(int i = 0; i < coffeeProvider.coffee_lst.length; i++){
      if(coffeeProvider.coffee_lst[i].type == 'special'){
        special_widgets.add(
            CoffeeSelectCard(
              id: coffeeProvider.coffee_lst[i].id,
              img: coffeeProvider.coffee_lst[i].img,
              name: coffeeProvider.coffee_lst[i].name,
              eng_name: coffeeProvider.coffee_lst[i].name_eng,
            )
        );

        special_widgets.add(
          SizedBox(height: 10,),
        );
      }
    }



    return Column(
      children: [
        if(special_widgets.length == 0)...[Center(child: CircularProgressIndicator())],
        if(special_widgets.length > 0)...special_widgets,

      ],
    );
  }
}
