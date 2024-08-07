import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/model/coffee_add_provider.dart';
import 'package:madcamp_week2/model/coffee_model.dart';
import 'package:madcamp_week2/model/coffee_note_model.dart';
import 'package:madcamp_week2/pages/login_page.dart';
import 'package:madcamp_week2/pages/root_page.dart';
import 'package:madcamp_week2/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '68780500961d2727792ebaed3c71f633');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => UserController()),
        // ChangeNotifierProvider(create: (_) => CoffeeNoteModel()),
        ChangeNotifierProvider(create: (context) => CoffeeNoteModel()..loadCoffeeNotes()),
        // ChangeNotifierProvider(create: (context) => CoffeeModel()..loadCoffee()),
        ChangeNotifierProvider(create: (context) => CoffeeModel()..loadCoffee()),
        ChangeNotifierProvider(
            create: (BuildContext context) => CoffeeAddProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: myColor.mainColor),
          scaffoldBackgroundColor: myColor.background,
          useMaterial3: true,
        ),
        home: RootPage(),
      ),
    );
  }
}
