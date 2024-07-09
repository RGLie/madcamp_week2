class CoffeeUser {
  String id;
  String name;
  List<dynamic> review_lst;


  CoffeeUser({
    required this.id,
    required this.name,
    required this.review_lst,
  });

  // Json 받아서 모델 생성
  factory CoffeeUser.fromJson(Map<String, dynamic> json) {
    return CoffeeUser(
      id: json['id'],
      name: json['name'],
      review_lst: json['review_lst'],
    );
  }

  // 모델을 json 형태로 리턴
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'review_lst': review_lst,
    };
  }
}

