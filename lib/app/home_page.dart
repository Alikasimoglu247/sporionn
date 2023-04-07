import 'package:flutter/material.dart';
import 'package:orionn/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';


class HomePage extends StatelessWidget {

   final userrr? user;

  const HomePage({Key? key,this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(onPressed: ()=> _cikisyap(context),
              child: 
              Text("çıkış yap",style: TextStyle(color: Colors.white),))
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("hoşgeldiniz  ${user?.userID}"),

      ),
    );
  }

  Future <bool> _cikisyap(BuildContext context) async{

    final userModel = context.read<UserModel>();
    bool sonuc = await userModel.signOut();

    return sonuc;
  }
}
