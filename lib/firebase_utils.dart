import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/providers/user_provider.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          MyUser.fromJson(snapshot.data()!),
      toFirestore: (user, options) => user.toJson(),
    );
  }

  static Future<void> addUserInFireStore(MyUser myUser) {
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> getUserFromFireStore(String id) async {
    var query = await getUserCollection().doc(id).get();
    return query.data();
  }

  static CollectionReference<Event> getEventCollection(String userId) {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .doc(userId)
        .collection(Event.collectionName).withConverter(
      fromFirestore: (snapshot, options) => Event.fromJson(snapshot.data()!),
      toFirestore: (event, options) => event.toJson(),);
  }

  static Future<void> addEventInFireStore(Event event) {
    var docRef = getEventCollection(event.userId).doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  static Stream<List<Event>> getAllEvent({required UserProvider userProvider}) {
    var stream = FirebaseUtils.getEventCollection(userProvider.myUser?.id ?? '')
        .orderBy('date')
        .snapshots();
    return stream.map((query) {
      return query.docs.map((element) {
        return element.data();
      }).toList();
    });
  }

  static Stream<List<Event>> getFilterEvent(
      {required int selectedIndex, required UserProvider userProvider}) {
    var stream = FirebaseUtils.getEventCollection(userProvider.myUser?.id ?? '')
        .where('index', isEqualTo: selectedIndex)
        .orderBy('date')
        .snapshots();
    return stream.map((query) {
      return query.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  static Future<void> updateEvent(
      { required Event event, required String userId}) {
    return getEventCollection(userId).doc(event.id).update(
        {'is_favorite': !event.isFavorite});
  }

  static Stream<List<Event>> getFavoriteEvents(
      {required UserProvider userProvider}) {
    var stream = FirebaseUtils.getEventCollection(userProvider.myUser?.id ?? '')
        .where('is_favorite', isEqualTo: true)
        .orderBy('date')
        .snapshots();
    return stream.map((query) {
      return query.docs.map((element) {
        return element.data();
      }).toList();
    });
  }
}
