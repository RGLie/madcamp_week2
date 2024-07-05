import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';

class TagButton extends StatefulWidget {
  final String label;
  final bool isSelected;


  const TagButton({super.key, required this.label, required this.isSelected});

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected? myColor.mainColor: myColor.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Text(widget.label, style: TextStyle(fontWeight: FontWeight.bold, color: widget.isSelected? myColor.cardColor: myColor.mainColor),),
      ),
    );
  }
}
