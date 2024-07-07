class Human {
  int age;
  String name;

  Human({
    required this.age,
    required this.name,
  });

  // Json 받아서 모델 생성
  factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
      age: json['age'],
      name: json['name'],

    );
  }

  // 모델을 json 형태로 리턴
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'name': name,
    };
  }
}

