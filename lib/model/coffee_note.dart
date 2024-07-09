class CoffeeNote {
  String id;
  String written_id;
  String coffee_id;
  bool note_floral;
  bool note_fruit;
  bool note_berry;
  bool note_nut;
  bool note_choco;
  bool note_cereal;
  int taste_sweet;
  int taste_sour;
  int taste_bitter;
  int taste_body;
  int overall_score;
  String feeling;

  CoffeeNote({
    required this.id,
    required this.written_id,
    required this.coffee_id,
    required this.note_floral,
    required this.note_fruit,
    required this.note_berry,
    required this.note_nut,
    required this.note_choco,
    required this.note_cereal,
    required this.taste_sweet,
    required this.taste_sour,
    required this.taste_bitter,
    required this.taste_body,
    required this.overall_score,
    required this.feeling,
  });

  // Json 받아서 모델 생성
  factory CoffeeNote.fromJson(Map<String, dynamic> json) {
    return CoffeeNote(
      id: json['_id'],
      written_id: json['written_id'],
      coffee_id: json['coffee_id'],
      note_floral: json['note_floral'],
      note_fruit: json['note_fruit'],
      note_berry: json['note_berry'],
      note_nut: json['note_nut'],
      note_choco: json['note_choco'],
      note_cereal: json['note_cereal'],
      taste_sweet: json['taste_sweet'],
      taste_sour: json['taste_sour'],
      taste_bitter: json['taste_bitter'],
      taste_body: json['taste_body'],
      overall_score: json['overall_score'],
      feeling: json['feeling'],

    );
  }

  // 모델을 json 형태로 리턴
  Map<String, dynamic> toJson() {
    return {
      'written_id': written_id,
      'coffee_id': coffee_id,
      'note_floral': note_floral,
      'note_fruit': note_fruit,
      'note_berry': note_berry,
      'note_nut': note_nut,
      'note_choco': note_choco,
      'note_cereal': note_cereal,
      'taste_sweet': taste_sweet,
      'taste_sour': taste_sour,
      'taste_bitter': taste_bitter,
      'taste_body': taste_body,
      'overall_score': overall_score,
      'feeling': feeling,
    };
  }
}

