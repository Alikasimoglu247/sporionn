import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orionn/app/landing_Page.dart';
import 'package:orionn/locator.dart';

import 'package:orionn/viewmodel/user_model.dart';
import 'package:provider/provider.dart';



void main() async {
  setuplocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp() );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
          title: "flutter lovers",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home:  LandingPage(),


          )

    );
  }

}
