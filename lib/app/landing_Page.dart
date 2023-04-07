import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_in/Sign_In_Page.dart';
import 'home_page.dart';
import '../viewmodel/user_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});


  @override
  Widget build(BuildContext context) {
    final _userModel = context.watch<UserModel>();
    if(_userModel.state == ViewState.Idle){
      if(_userModel.user == null){
        return  SignInPage();
      }else{
        return HomePage(user: _userModel.user);

      }

    }else{

      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

  }

}
