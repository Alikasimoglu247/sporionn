import 'package:get_it/get_it.dart';
import 'package:orionn/repository/user_repository.dart';
import 'package:orionn/services/fake_auth_service.dart';
import 'package:orionn/services/firebase_auth_service.dart';
import 'package:orionn/services/firestore_db_service.dart';

  GetIt locator = GetIt.instance;

void setuplocator(){
locator.registerLazySingleton(() => FirebaseAuthService());
locator.registerLazySingleton(() => FakeAuthenticatiobService());
locator.registerLazySingleton(() => FirestoreDBService());
locator.registerLazySingleton(() => UserRepository());

}
