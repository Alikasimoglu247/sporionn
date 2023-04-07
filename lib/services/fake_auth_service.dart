import 'package:firebase_auth/firebase_auth.dart';
import 'package:orionn/services/auth_base.dart';

import '../model/user_model.dart';

class FakeAuthenticatiobService implements AuthBase {
  String userID = "121131242141241221";

  @override
  Future<userrr?> currentUser() async {
    return await Future.value(userrr(userID: userID, email: "fakeemail@fake.com"));
  }

  @override
  Future<userrr?> signInAnonymously() async {
    return await Future.delayed(
        const Duration(seconds: 0), () => userrr(userID: userID , email: "fakeemail@fake.com"));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<userrr?> signInWithGoogle() async {
    return await Future.delayed(
        const Duration(seconds: 0), () => userrr(userID: "google userID", email: "fakeemail@fake.com"));
  }

  @override
  Future<userrr?> signInWithFacebook() async {
    return await Future.delayed(
        const Duration(seconds: 0), () => userrr(userID: "facebook userID", email: "fakeemail@fake.com"));
  }

  @override
  Future<userrr?> createUserWithEmailandPassword(
      String email, String sifre) async {
    return await Future.delayed(const Duration(seconds: 0),
        () => userrr(userID: " created mail userID", email: "fakeemail@fake.com"));
  }

  @override
  Future<userrr?> signInWithEmailandPassword(String email, String sifre) async {
    return await Future.delayed(
        const Duration(seconds: 0), () => userrr(userID: "sign ın  userID", email: "fakeemail@fake.com"));
  }
}
