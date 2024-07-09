import 'package:flutter/material.dart';
import 'package:madcamp_week2/model/coffee_note_model.dart';
import 'package:madcamp_week2/pages/login_page.dart';
import 'package:madcamp_week2/pages/tab_page.dart';
import 'package:madcamp_week2/providers/user_provider.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var uProvider = Provider.of<UserController>(context, listen: false);
      var coffeeProvider = Provider.of<CoffeeNoteModel>(context, listen: false);

      uProvider.checkToken();
      coffeeProvider.loadCoffeeNotes();

    });
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);




    if(userProvider.token == null){
      return LoginPage();
    }
    else{
      // print(userProvider.user?.kakaoAccount!.email);
      // print(userProvider.user?.kakaoAccount!.name);
      // print(userProvider.user?.kakaoAccount!.phoneNumber);
      if(userProvider.coffeeUser == null){
        userProvider.getCoffeeUserData();
      }



      return TabPage();
    }
  }
}
