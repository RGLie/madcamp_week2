import 'package:flutter/cupertino.dart';

class CoffeeAddProvider extends ChangeNotifier{
  String _selectedCoffeeID = '';
  String get selectedCofffeeID => _selectedCoffeeID;

  String _selectedCoffeeName = '';
  String get selectedCoffeeName => _selectedCoffeeName;

  void setCoffee(String id, String name){
    _selectedCoffeeID = id;
    _selectedCoffeeName = name;
    notifyListeners();
  }

  void initialCoffee(){
    _selectedCoffeeID = '';
    _selectedCoffeeName = '';
    notifyListeners();
  }


}