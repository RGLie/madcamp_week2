import 'package:flutter/material.dart';
import 'package:madcamp_week2/widget/coffee_select_card.dart';

class EtcCoffee extends StatefulWidget {
  const EtcCoffee({super.key});

  @override
  State<EtcCoffee> createState() => _EtcCoffeeState();
}

class _EtcCoffeeState extends State<EtcCoffee> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoffeeSelectCard(
          img: 'assets/bean.png',
          name: '카누',
          eng_name: 'KANU',
        )
      ],
    );
  }
}
