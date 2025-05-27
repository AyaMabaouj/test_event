import 'package:get/get.dart';
import '../models/event_model.dart';
import '../services/event_service.dart';

class EventController extends GetxController {
  final EventService _service = EventService();
  var events = <EventModel>[].obs;

  @override
  void onInit() {
    events.bindStream(_service.getEvents());
    super.onInit();
  }

  void logButton(int id) async {
    try {
      await _service.logEvent(EventModel(buttonId: id, timestamp: DateTime.now()));
    } catch (e) {
     print("Firebase Error: $e");
     Get.snackbar('Error', 'Failed to save the event');
    }
  }
}
