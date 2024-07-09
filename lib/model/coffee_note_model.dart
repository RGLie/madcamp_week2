import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:madcamp_week2/model/coffee_note.dart';

import '../constants/url.dart';


class CoffeeNoteModel extends ChangeNotifier{
  late List<CoffeeNote> _coffee_note_lst = [];
  List<CoffeeNote> get coffee_note_lst => _coffee_note_lst;


  Future<bool> loadCoffeeNotes() async {
    var dio = Dio();

    try {
      final response = await dio.get(API_COFFEE_GET_NOTES_URL);

      dynamic data = response.data;

      _coffee_note_lst = (data['data'] as List)
          .map((tracks) => CoffeeNote.fromJson(tracks))
          .toList();

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }


  Future<bool> createCoffeeNote(CoffeeNote coffeenote) async {
    var dio = Dio();

    try {
      final response = await dio.post(
          API_COFFEE_ADD_NOTES_URL,
          data: {
            "written_id": coffeenote.written_id,
            "coffee_id": coffeenote.coffee_id,
            "note_floral": coffeenote.note_floral,
            "note_fruit": coffeenote.note_fruit,
            "note_berry": coffeenote.note_berry,
            "note_nut": coffeenote.note_nut,
            "note_choco": coffeenote.note_choco,
            "note_cereal": coffeenote.note_cereal,
            "taste_sweet": coffeenote.taste_sweet,
            "taste_sour": coffeenote.taste_sour,
            "taste_bitter": coffeenote.taste_bitter,
            "taste_body": coffeenote.taste_body,
            "overall_score": coffeenote.overall_score,
            "feeling": coffeenote.feeling
          });

      final cnote = CoffeeNote.fromJson(response.data['data']);
      _coffee_note_lst.add(cnote);

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }
}