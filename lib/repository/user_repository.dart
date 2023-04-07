import 'package:orionn/model/user_model.dart';
import 'package:orionn/services/auth_base.dart';
import 'package:orionn/services/firebase_auth_service.dart';

import '../locator.dart';
import '../services/fake_auth_service.dart';
import '../services/firestore_db_service.dart';

enum AppMode{DEBUG,RELEASE}

class UserRepository implements AuthBase {

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticatiobService _fakeAuthenticatiobService=locator <FakeAuthenticatiobService>();
  FirestoreDBService _firestoreDBService=locator <FirestoreDBService>();

  AppMode appMode=AppMode.RELEASE;
  @override
  Future<userrr?> currentUser() async{
    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.currentUser();

    }else{
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<userrr?> signInAnonymously() async{
    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.signInAnonymously();

    }else{
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async{
    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.signOut();

    }else{
      return await _firebaseAuthService.signOut();
    }

  }

  @override
  Future<userrr?> signInWithGoogle() async{
    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.signInWithGoogle();

    }else{
      return await _firebaseAuthService.signInWithGoogle();
    }


  }

  @override
  Future<userrr?> signInWithFacebook() async{

    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.signInWithFacebook();

    }else{
      return await _firebaseAuthService.signInWithFacebook();
    }

  }

  @override
  Future<userrr?> createUserWithEmailandPassword(String email, String sifre) async {

    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.createUserWithEmailandPassword(email, sifre);

    }else{
      userrr? _user =  await _firebaseAuthService.createUserWithEmailandPassword(email, sifre);
     bool? _sonuc = await _firestoreDBService.saveUser(_user!);
     if(_sonuc != null && _sonuc){
       return _user;
     }else return null;
    }
  }

  @override
  Future<userrr?> signInWithEmailandPassword(String email, String sifre) async {

    if(appMode ==AppMode.DEBUG) {
      return await _fakeAuthenticatiobService.signInWithEmailandPassword(email, sifre);

    }else{
      return await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
    }
  }
}