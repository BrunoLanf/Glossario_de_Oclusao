import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class DataBaseManager {
  static final _database = FirebaseFirestore.instance;

  static get _users => _database.collection('users');

  static setUser(String userId, User user) async {
    await _users.doc(userId).set(user.toJson());
  }

  static getUser(String userId) async {
    var document = await _users.doc(userId).get();
    return User.fromJson(document.data() as Map<String, dynamic>);
  }
}
