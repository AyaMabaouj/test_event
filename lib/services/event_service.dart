import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class EventService {
  final _db = FirebaseFirestore.instance.collection('events');

  Future<void> logEvent(EventModel event) async {
    await _db.add(event.toMap());
  }

  Stream<List<EventModel>> getEvents() {
    return _db
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => EventModel.fromMap(doc.data()))
            .toList());
  }
}
