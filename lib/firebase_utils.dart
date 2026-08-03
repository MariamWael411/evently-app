import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static Future<void> addUserInFireStore(MyUser myUser) {
    return getCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> getUserFromFireStore(String id) async {
    var query = await getCollection().doc(id).get();
    return query.data();
  }
}
