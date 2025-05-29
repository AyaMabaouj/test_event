class EventModel {
  final String? id; 
  final int buttonId;
  final DateTime timestamp;

  EventModel({
    this.id, 
    required this.buttonId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() => {
        'buttonId': buttonId,
        'timestamp': timestamp.toIso8601String(),
      };

  factory EventModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return EventModel(
      id: id,
      buttonId: map['buttonId'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
