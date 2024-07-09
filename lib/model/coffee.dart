class Coffee {
  String id;
  String img;
  String type;
  String name;
  String name_eng;
  String script;
  List<dynamic> review_lst;


  Coffee({
    required this.id,
    required this.img,
    required this.type,
    required this.name,
    required this.name_eng,
    required this.script,
    required this.review_lst,
  });

  // Json 받아서 모델 생성
  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['_id'],
      img: json['img'],
      type: json['type'],
      name: json['name'],
      script: json['script'],
      name_eng: json['name_eng'],
      review_lst: json['review_lst'],
    );
  }

  // 모델을 json 형태로 리턴
  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'type': type,
      'name': name,
      'script': script,
      'name_eng': name_eng,
      'review_lst': review_lst,
    };
  }
}

