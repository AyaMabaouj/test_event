class EventModel {
  final int buttonId;
  final DateTime timestamp;

  EventModel({required this.buttonId, required this.timestamp});

  Map<String, dynamic> toMap() => {
        'buttonId': buttonId,
        'timestamp': timestamp.toIso8601String(),
      };

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      buttonId: map['buttonId'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
