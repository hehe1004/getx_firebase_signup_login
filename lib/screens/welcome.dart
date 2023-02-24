import 'package:flutter/material.dart';
import 'package:getx_example5/controller/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('welcome'),
            IconButton(onPressed: () {
              AuthController.instance.logout();
            },
              icon: Icon(Icons.login_outlined),
            ),
          ],


        ),
      ),
    );
  }
}
