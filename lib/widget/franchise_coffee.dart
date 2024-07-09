import 'package:flutter/material.dart';
import 'package:madcamp_week2/model/coffee_model.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';
import 'package:provider/provider.dart';

class FranchiseCoffee extends StatefulWidget {
  const FranchiseCoffee({super.key});

  @override
  State<FranchiseCoffee> createState() => _FranchiseCoffeeState();
}

class _FranchiseCoffeeState extends State<FranchiseCoffee> {
  List<Widget> franchise_widget = [];

  @override
  Widget build(BuildContext context) {
    final coffeeProvider = Provider.of<CoffeeModel>(context);
    for(int i = 0; i < coffeeProvider.coffee_lst.length; i++){
      if(coffeeProvider.coffee_lst[i].type == 'franchise'){
        franchise_widget.add(
            CoffeeSelectCard(
              id: coffeeProvider.coffee_lst[i].id,
              img: coffeeProvider.coffee_lst[i].img,
              name: coffeeProvider.coffee_lst[i].name,
              eng_name: coffeeProvider.coffee_lst[i].name_eng,
            )
        );

        franchise_widget.add(
          SizedBox(height: 10,),
        );
      }
    }
    return Column(
      children: [
        if(franchise_widget.length == 0)...[Center(child: CircularProgressIndicator())],
        if(franchise_widget.length > 0)...franchise_widget,

      ],
    );
  }
}
