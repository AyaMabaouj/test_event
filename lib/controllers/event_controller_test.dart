import 'package:get/get.dart';
import '../models/event_model.dart';

class EventController extends GetxController {
  var events = <EventModel>[].obs;

  void logButton(int id) {
    final event = EventModel(buttonId: id, timestamp: DateTime.now());
    events.add(event);
  }
}
