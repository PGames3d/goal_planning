import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationStorage {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static const String _collectionName = 'notifications';

  static String _getUserId() {
    print("User email id ************* ${_auth.currentUser?.email}");
    return _auth.currentUser?.email ?? '';
  }

  static Future<void> saveNotification(
      Map<String, dynamic> notification) async {
    String userId = _getUserId();
    if (userId.isEmpty) return;

    CollectionReference notificationsCollection =
        _firestore.collection('users').doc(userId).collection(_collectionName);

    try {
      await notificationsCollection.add({
        ...notification,
        'receivedAt': FieldValue.serverTimestamp(),
        // 'status': 'unread',
      });
    } catch (e) {
      print("Error saving notification: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> getNotifications() async {
    String userId = _getUserId();
    if (userId.isEmpty) return [];

    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection(_collectionName)
        .orderBy('receivedAt', descending: true)
        .limit(10)
        .get();

List<Map<String, dynamic>> notifications = snapshot.docs.map((doc) {
   final data = doc.data() as Map<String, dynamic>;
      return {
        'id': doc.id,
        'title': data.containsKey('title') ? data['title'] : 'No Title',
        'body': data.containsKey('body') ? data['body'] : 'No body available',
        'data': doc['data'],
        'status': doc['status'],
        'receivedAt':
            (doc['receivedAt'] as Timestamp).toDate().toIso8601String(),
      };
    }).toList();

    QuerySnapshot olderNotificationsSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection(_collectionName)
        .orderBy('receivedAt', descending: true)
        .startAfterDocument(snapshot.docs.last) 
        .get();

    for (var doc in olderNotificationsSnapshot.docs) {
      await doc.reference.delete();
    }
    return notifications;
  }

  static Future<void> markAsRead(String notificationId) async {
    String userId = _getUserId();
    if (userId.isEmpty) return;
    await _firestore
        .collection('users')
        .doc(userId)
        .collection(_collectionName)
        .doc(notificationId)
        .update({'status': 'read'});
  }
}

