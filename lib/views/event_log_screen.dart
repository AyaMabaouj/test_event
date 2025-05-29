import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/event_controller.dart';
import '../models/event_model.dart'; // <-- Nécessaire pour accéder à EventModel

class EventLogScreen extends StatelessWidget {
  final controller = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event History")),
      body: SafeArea(
        child: Obx(() {
          if (controller.events.isEmpty) {
            return const Center(child: Text("No events recorded"));
          }
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(
              12,
              12,
              12,
              MediaQuery.of(context).padding.bottom + 80,
            ),
            itemCount: controller.events.length,
            itemBuilder: (context, index) {
              final e = controller.events[index];
              return Card(
                  color: Colors.white, // <-- ajoute cette ligne
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 3, 99, 178),
                    child: Text(
                      e.buttonId.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text("Event ${e.buttonId} pressed"),
                  subtitle: Text(
                    DateFormat('dd/MM/yyyy hh:mm:ss a').format(e.timestamp),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteEvent(e),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
