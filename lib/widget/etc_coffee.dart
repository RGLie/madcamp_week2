import 'package:flutter/material.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';
import 'package:provider/provider.dart';

import '../model/coffee_model.dart';

class EtcCoffee extends StatefulWidget {
  const EtcCoffee({super.key});

  @override
  State<EtcCoffee> createState() => _EtcCoffeeState();
}

class _EtcCoffeeState extends State<EtcCoffee> {
  List<Widget> etc_widget = [];

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeModel>(context);

    for(int i = 0; i < coffeeProvider.coffee_lst.length; i++){
      if(coffeeProvider.coffee_lst[i].type == 'etc'){
        etc_widget.add(
            CoffeeSelectCard(
              id: coffeeProvider.coffee_lst[i].id,
              img: coffeeProvider.coffee_lst[i].img,
              name: coffeeProvider.coffee_lst[i].name,
              eng_name: coffeeProvider.coffee_lst[i].name_eng,
            )
        );

        etc_widget.add(
          SizedBox(height: 10,),
        );
      }
    }


    return Column(
      children: [
        if(etc_widget.length == 0)...[Center(child: CircularProgressIndicator())],
        if(etc_widget.length > 0)...etc_widget,

      ],
    );
  }
}
