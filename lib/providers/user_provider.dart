import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:madcamp_week2/model/coffee.dart';

import '../constants/url.dart';
import '../model/coffee_user.dart';
import '../model/myuser.dart';


class UserController with ChangeNotifier {
  OAuthToken? _token = null;
  OAuthToken? get token => _token;

  MyUser? _profileInfo = null;
  MyUser? get profileInfo => _profileInfo;

  CoffeeUser? _coffeeUser = null;
  CoffeeUser? get coffeeUser => _coffeeUser;

  void signInKakao() async{
    // if (await isKakaoTalkInstalled()) {
    //   try {
    //     _token = await UserApi.instance.loginWithKakaoTalk();
    //
    //     print('카카오톡으로 로그인 성공');
    //     await TokenManagerProvider.instance.manager.setToken(_token!);
    //     _user = await UserApi.instance.me();
    //
    //
    //     notifyListeners();
    //   } catch (error) {
    //     print('카카오톡으로 로그인 실패 $error');
    //
    //     // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
    //     // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
    //     if (error is PlatformException && error.code == 'CANCELED') {
    //       return;
    //     }
    //     // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
    //     try {
    //       _token = await UserApi.instance.loginWithKakaoAccount();
    //       await TokenManagerProvider.instance.manager.setToken(_token!);
    //       _user = await UserApi.instance.me();
    //       notifyListeners();
    //       print('카카오계정으로 로그인 성공');
    //     } catch (error) {
    //       print('카카오계정으로 로그인 실패 $error');
    //     }
    //   }
    // } else {
    //   try {
    //     _token = await UserApi.instance.loginWithKakaoAccount();
    //     await TokenManagerProvider.instance.manager.setToken(_token!);
    //     _user = await UserApi.instance.me();
    //     notifyListeners();
    //     print('카카오계정으로 로그인 성공');
    //   } catch (error) {
    //     print('카카오계정으로 로그인 실패 $error');
    //   }
    // }
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      _token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${_token?.accessToken}'
        },
      );
      // print(json.decode(response.body));
      // print(json.decode(response.body).runtimeType);

      _profileInfo = MyUser.fromJson(json.decode(response.body));

      // print(json.decode(response.body));
      // print(_profileInfo.toString());


    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }

    notifyListeners();
  }

  void checkToken() async{

    try{
      _token = await TokenManagerProvider.instance.manager.getToken();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${_token?.accessToken}'
        },
      );
      // print(json.decode(response.body));
      // print(json.decode(response.body));
      // print(json.decode(response.body).runtimeType);
      _profileInfo = MyUser.fromJson(json.decode(response.body));
      notifyListeners();

    }catch (error) {
      print('자동 로그인 실패 $error');
    }
    notifyListeners();
  }

  void signOutKakao() async{
    await UserApi.instance.logout();
    TokenManagerProvider.instance.manager.clear();
    _profileInfo = null;
    _token = null;
    notifyListeners();
  }



  Future<bool> getCoffeeUserData() async {
    var dio = Dio();

    try {
      final response = await dio.post(
          API_COFFEE_USER_LOGIN,
          data: {
            "id": _profileInfo?.id.toString(),
            "name": _profileInfo?.properties.nickname
          });

      final user = CoffeeUser.fromJson(response.data['data']);
      _coffeeUser = user;

      notifyListeners();
      return true;
    } catch (exception) {
      print(exception);
    }
    return false;
  }
}