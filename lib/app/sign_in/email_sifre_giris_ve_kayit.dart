import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orionn/model/user_model.dart';
import 'package:orionn/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

import '../../Common_widget/social_log_in_button.dart';
import '../home_page.dart';

enum Formtype { Register, LogIn }

class EmailveSifreLoginPage extends StatefulWidget {
  const EmailveSifreLoginPage({Key? key}) : super(key: key);

  @override
  State<EmailveSifreLoginPage> createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String? _email, _sifre;
  String? _buttonText, _linkText;
  var _formtype = Formtype.LogIn;
  final _formkey = GlobalKey<FormState>();

  void _formSubmit(context) async {
    _formkey.currentState?.save();
    debugPrint("email:" + (_email ?? "") + "sifre" + (_sifre ?? ""));
    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (_formtype == Formtype.LogIn) {
      userrr? _girisYapanUser = await _userModel.signInWithEmailandPassword(
          (_email ?? ""), (_sifre ?? ""));
      if (_girisYapanUser != null) {
        print("oturum Açan user id:" + _girisYapanUser.userID.toString());
      }
    } else {
      userrr? _olusturulanUser = await _userModel
          .createUserWithEmailandPassword((_email ?? ""), (_sifre ?? ""));
      if (_olusturulanUser != null) {
        print("oturum Açan user id:" + _olusturulanUser.userID.toString());
      }
    }
  }

  void _degistir() {
    setState(() {
      _formtype =
          _formtype == Formtype.LogIn ? Formtype.Register : Formtype.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buttonText = _formtype == Formtype.LogIn ? "Giriş yap" : "Kayıt ol";
    _linkText = _formtype == Formtype.LogIn
        ? "Hesabınız yoksa, Kayıt Olun"
        : "Hesabınız varsa, Giriş yapın";

    final _userModel = context.watch<UserModel>();

   /* if(_userModel.state == ViewState.Idle){
      if(_userModel.user != null){
        return  HomePage();
      }
    }else{

      return Center(
        child: CircularProgressIndicator(),

      );

    } */

    if (_userModel.user != null){
      Future.delayed(Duration(milliseconds: 20), () {
      Navigator.of(context).pop();
    });
          }
    return Scaffold(
        appBar: AppBar(
          title: Text("Giriş / Kayıt"),
        ),
        body: _userModel.state == ViewState.Idle ? SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formkey, // form key added here
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: _userModel.emailHataMesaji != null ? _userModel.emailHataMesaji : null ,
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (girilenEmail) {
                      _email = girilenEmail;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: _userModel.sifreHataMesaji != null ? _userModel.sifreHataMesaji : null ,
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Password',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (girilenSifre) {
                      _sifre = girilenSifre;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SocialLoginButton(
                    buttontext: (_buttonText!),
                    butoncolor: Theme.of(context).primaryColor,
                    butonIcon: Icon(Icons.accessible),
                    radius: 15,
                    onPressed: () => _formSubmit(context),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextButton(
                      onPressed: () => _degistir(),
                      child: Text(
                        _linkText ?? '',
                      ))
                ],
              )),
        )
        ): Center(
          child: CircularProgressIndicator(),
        )



    );
  }
}
