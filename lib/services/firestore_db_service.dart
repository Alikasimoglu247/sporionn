import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orionn/model/user_model.dart';
import 'package:orionn/services/database_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseAuth = FirebaseFirestore.instance;

  @override
  Future<bool>? saveUser(userrr user) async {
    await _firebaseAuth.collection("users").doc(user.userID).set(user.toMap());
    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

   /* Map _okunanUserBilgileriMap = _okunanUser.data;
    userrr _okunanUserBilgileriNesne = userrr.fromMap(_okunanUserBilgileriMap);

    print("okunan user nesnesi :"+_okunanUserBilgileriNesne.toString()); */
    return true;
  }
}
