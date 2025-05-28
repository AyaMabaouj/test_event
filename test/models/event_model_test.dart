import 'package:flutter_test/flutter_test.dart';
import 'package:test_event/models/event_model.dart';

void main() {
  test('EventModel toMap and fromMap', () {
    final event = EventModel(buttonId: 2, timestamp: DateTime.parse("2024-01-01T12:00:00Z"));

    final map = event.toMap();
    final fromMap = EventModel.fromMap(map);

    expect(fromMap.buttonId, 2);
    expect(fromMap.timestamp, DateTime.parse("2024-01-01T12:00:00Z"));
  });
}
