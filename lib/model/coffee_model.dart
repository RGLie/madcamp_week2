import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:madcamp_week2/model/coffee.dart';
import 'package:madcamp_week2/model/coffee_note.dart';

import '../constants/url.dart';


class CoffeeModel extends ChangeNotifier{
  late List<Coffee> _coffee_lst = [];
  List<Coffee> get coffee_lst => _coffee_lst;

  // Dio _dio = Dio();
  // Dio get dio => _dio;

  // DioProvider._internal();

  Future<bool> loadCoffee() async {
    var dio = Dio();

    try {
      final response = await dio.get(API_COFFEE_GET_COFFEE_URL);

      dynamic data = response.data;
      _coffee_lst = (data['data'] as List)
          .map((tracks) => Coffee.fromJson(tracks))
          .toList();

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }

  Future<bool> addCoffeeNote(String cid, String review_id) async {
    var dio = Dio();

    try {
      final response = await dio.post(
          API_COFFEE_ADD_REVIEW_IN_COFFEE,
          data: {
            "coffee_id": cid,
            "review": review_id
          });

      // final user = CoffeeUser.fromJson(response.data['data']);
      // _coffeeUser = user;

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }



}