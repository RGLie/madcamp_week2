class MyUser {
  int id;
  Properties properties;

  MyUser({
    required this.id,
    required this.properties,
  });

  // Json 받아서 모델 생성
  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      id: json['id'],
      properties: Properties.fromJson(json['properties'])

    );
  }

}

class Properties {
  String nickname;

  Properties({
    required this.nickname,
  });

  // Json 받아서 모델 생성
  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      nickname: json['nickname'],

    );
  }

  // 모델을 json 형태로 리턴
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
    };
  }
}
