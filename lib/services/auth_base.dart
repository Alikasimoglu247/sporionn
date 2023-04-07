import 'package:firebase_auth/firebase_auth.dart';
import 'package:orionn/model/user_model.dart';

abstract class AuthBase{

  Future<userrr?> currentUser();
  Future<userrr?> signInAnonymously();
  Future<bool> signOut();
  Future<userrr?> signInWithGoogle();
  Future<userrr?> signInWithFacebook();
  Future<userrr?> signInWithEmailandPassword(String email,String sifre);
  Future<userrr?> createUserWithEmailandPassword(String email,String sifre);


}