import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:orionn/model/user_model.dart';

import 'auth_base.dart';

class FirebaseAuthService implements AuthBase{

  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  @override
  Future<userrr?> currentUser() async {

    try {
      User? user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    }
    catch (e) {
      print("hata current userrrrrrrr" + e.toString());
      return null;
    }

  }

  userrr? _userFromFirebase(User? user) {

    if (user == null) {
      return null;
    }
    else {

      return userrr(userID: user.uid, email: user.email);
    }
  }
  @override
  Future<userrr?> signInAnonymously() async {
    try{
      UserCredential  sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user)!;

    }catch(e){
      print("ananonim giriş hata" + e.toString());
      return null;
    }


  }

  @override
  Future<bool>   signOut()  async{
    try {
      final _googleSingIn = GoogleSignIn();
      await _googleSingIn.signOut();
      final _facebookLogin = FacebookAuth.instance;
      await _facebookLogin.logOut();


      await _firebaseAuth.signOut();
      return true;
    } catch(e){
      print("hata current userrrrrrrrr" + e.toString());
      return false;
    }

  }

  @override
  Future<userrr?> signInWithGoogle() async {

    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

    if(_googleUser != null){
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if(_googleAuth.idToken != null && _googleAuth.accessToken !=null){

        UserCredential  sonuc = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(idToken:_googleAuth.idToken,accessToken:_googleAuth.accessToken )
        );
        User? _user = sonuc.user;
        return _userFromFirebase(_user);
      }else{
        return null;
      }
    }else{
      return null;
    }


  }

  @override
  Future<userrr?> signInWithFacebook() async {

    final _facebookLogin = FacebookAuth.instance;
    final _faceResult = await _facebookLogin.login(permissions: ['public_profile','email']);



    switch (_faceResult.status){

      case LoginStatus.success:
        if(_faceResult.accessToken != null){
          UserCredential  _firebaseResult = await _firebaseAuth.signInWithCredential(
              FacebookAuthProvider.credential(_faceResult.accessToken!.token));

          User? _user = _firebaseResult.user;
          return _userFromFirebase(_user);

        }
        break;

      case LoginStatus.cancelled:
        print("kullanıcı facebook girişi iptal etti");
        break;

      case LoginStatus.failed:
        print("hata cıktı ");
        break;
    }
    return null;


  }

  @override
  Future<userrr?> createUserWithEmailandPassword(String email, String sifre) async {
    try{
      UserCredential  sonuc = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: sifre);
      return _userFromFirebase(sonuc.user)!;

    }catch(e){
      print("create user hata" + e.toString());
      return null;
    }
  }

  @override
  Future<userrr?> signInWithEmailandPassword( String email, String sifre) async {
    try{
      UserCredential  sonuc = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: sifre);
      return _userFromFirebase(sonuc.user)!;

    }catch(e){
      print("sign in email hata" + e.toString());
      return null;
    }
  }


}