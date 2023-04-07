import 'package:flutter/material.dart';
import 'package:orionn/Common_widget/social_log_in_button.dart';
import 'package:orionn/app/sign_in/email_sifre_giris_ve_kayit.dart';
import 'package:orionn/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void _misafirgirisi(BuildContext context) async {
    final userModel = context.read<UserModel>();

    userrr? _user = await userModel.signInAnonymously();
    print(_user!.userID!.toString());
  }

  void _googleileGiris(BuildContext context) async {
    final userModel = context.read<UserModel>();

    userrr? _user = await userModel.signInWithGoogle();
    print(_user!.userID!.toString());
  }

  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailveSifreLoginPage(),
      ),
    );
  }

  void _facebookileGiris(BuildContext context) async {
    final userModel = context.read<UserModel>();

    userrr? _user = await userModel.signInWithFacebook();
    print(_user!.userID!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sporionn"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Oturum açın",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 8,
          ),
          SocialLoginButton(
            onPressed: () => _googleileGiris(context),
            buttontext: ("GMAİL  İLE GİRİŞ"),
            textcolor: Colors.black87,
            butoncolor: Colors.white,
            butonIcon: Image.asset("images/gmail.png"),
          ),
          SocialLoginButton(
            onPressed: () => _facebookileGiris(context),
            buttontext: "FACEBOOK İLE GİRİŞ",
            butoncolor: Color(0xFF334D92),
            butonIcon: Image.asset("images/facebook-logo-2019.png"),
          ),
          SocialLoginButton(
            onPressed: () => _emailVeSifreGiris(context),
            buttontext: "Mail Ve Şifre ile giriş",
            butonIcon: Icon(
              Icons.email,
              size: 33,
            ),
          ),
          SocialLoginButton(
            onPressed: () => _misafirgirisi(context),
            buttontext: "MİSAFİR GİRİŞİ",
            butoncolor: Colors.green,
            butonIcon: Icon(
              Icons.email,
              size: 33,
            ),
          ),
        ],
      ),
    );
  }
}
