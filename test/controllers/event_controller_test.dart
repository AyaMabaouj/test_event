// test/controllers/event_controller_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_event/models/event_model.dart';
import 'package:test_event/controllers/event_controller.dart';

import '../mocks/mock_event_service.mocks.dart';

void main() {
  late EventController controller;
  late MockEventService mockService;

  setUp(() {
    mockService = MockEventService();
    controller = EventController(service: mockService);
  });

  test('logButton calls logEvent on service', () async {
    final testEvent = EventModel(buttonId: 1, timestamp: DateTime.now());

    when(mockService.logEvent(any)).thenAnswer((_) async => null);

    await controller.logButton(testEvent.buttonId);

    verify(mockService.logEvent(argThat(
      isA<EventModel>().having((e) => e.buttonId, 'buttonId', testEvent.buttonId),
    ))).called(1);
  });
}
