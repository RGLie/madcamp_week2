import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:madcamp_week2/model/test.dart';

import '../constants/url.dart';


class HumanModel extends ChangeNotifier{
  late List<Human> _human_lst = [];
  List<Human> get human_lst => _human_lst;

  // Dio _dio = Dio();
  // Dio get dio => _dio;

  // DioProvider._internal();

  Future<bool> loadHuman() async {
    var dio = Dio();

    try {
      final response = await dio.get(API_TEST_URL);

      dynamic data = response.data;
      _human_lst = (data as List)
          .map((tracks) => Human.fromJson(tracks))
          .toList();

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }
}