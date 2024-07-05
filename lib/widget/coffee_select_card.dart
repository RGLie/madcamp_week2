import 'package:flutter/material.dart';
import 'package:madcamp_week2/constants/colors.dart';

class CoffeeSelectCard extends StatefulWidget {
  const CoffeeSelectCard({super.key});

  @override
  State<CoffeeSelectCard> createState() => _CoffeeSelectCardState();
}

class _CoffeeSelectCardState extends State<CoffeeSelectCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: myColor.cardColor,
      // margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      elevation: 3, // 카드 하단 그림자 크기
      // shadowColor: Colors.black.withOpacity(0.7),
      child: InkWell(
        // splashColor: myColor.background,
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ScrumPage(
          //             index: index, tags: arrived_tags)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2),
          child: ListTile(
            leading: Image(
              width: 60,
              image: AssetImage(
                  'assets/bean.png'
              ),
            ),
            title: Text(
              '에티오피아 예가체프 G2',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Ethiopian Yirgacheffe G2',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: myColor.gray5
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
