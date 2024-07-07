import 'package:flutter/material.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';

class FranchiseCoffee extends StatefulWidget {
  const FranchiseCoffee({super.key});

  @override
  State<FranchiseCoffee> createState() => _FranchiseCoffeeState();
}

class _FranchiseCoffeeState extends State<FranchiseCoffee> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoffeeSelectCard(
          img: 'assets/bean.png',
          name: '스타벅스',
          eng_name: 'Starbucks',
        )
      ],
    );
  }
}
