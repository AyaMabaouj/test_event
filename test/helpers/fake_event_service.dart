import 'package:test_event/models/event_model.dart';
import 'package:test_event/services/event_service.dart';
import 'dart:async';

class FakeEventService implements EventService {
  final List<EventModel> _loggedEvents = [];

  @override
  Future<void> logEvent(EventModel event) async {
    _loggedEvents.add(event);
  }

  @override
  Stream<List<EventModel>> getEvents() {
    return Stream.value(_loggedEvents);
  }
}
