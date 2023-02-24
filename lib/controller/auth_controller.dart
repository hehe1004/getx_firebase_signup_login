import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_example5/screens/login.dart';
import 'package:flutter/material.dart';

import '../screens/welcome.dart';

class AuthController extends GetxController {
  //getx에서 로그인기능 구현할때 가장 핵심 3줄
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  //기본적인 랜더닝 후 초기화 시켜주는
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    //user 를 스트림에 바인딩, 스트림은 유저의 모든 행동을 실시간으로 전달

    // ever(listener, callback)
    ever(_user, _moveToPage);
  }

  void _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }

  void login(String email, password){


}

    void register(String email, password) async {
      try {
        await authentication.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        Get.snackbar("error message", "user message",
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            titleText: Text(
              "Registration is failed",
              style: TextStyle(color: Colors.white),

            ),
          messageText: Text(e.toString(),
          style: TextStyle(color: Colors.white),
          ),
        );
      }
    }
    void logout(){
    authentication.signOut();
    }
}
