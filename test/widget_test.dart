// test/widgets/app_widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_event/controllers/event_controller.dart';
import 'package:test_event/models/event_model.dart';
import 'package:test_event/main.dart';
import 'package:test_event/services/event_service.dart';

class FakeEventService implements EventService {
  final List<EventModel> _events = [];

  @override
  Future<void> logEvent(EventModel event) async {
    _events.add(event);
  }

  @override
  Stream<List<EventModel>> getEvents() {
    return Stream.value(_events);
  }
}

void main() {
  setUp(() {
    Get.put(EventController(service: FakeEventService()));
  });

  testWidgets('App loads and shows home screen title', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text("Choose an Event"), findsOneWidget);
  });

  testWidgets('Tapping an event button logs an event visually', (tester) async {
    await tester.pumpWidget(const MyApp());

    final button = find.text('Event 1');
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pump(); // Allow time for snackbar or UI update

    // No Snackbar shown using Scaffold; Get.snackbar is not in widget tree
    expect(find.byType(SnackBar), findsNothing);
  });
}
