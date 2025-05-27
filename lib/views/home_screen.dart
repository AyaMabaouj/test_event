import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/event_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Logger"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Choose an Event",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final id = index + 1;
                  return ElevatedButton.icon(
                    onPressed: () => controller.logButton(id),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 99, 178),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.event_note),
                    label: Text("Event $id", style: const TextStyle(fontSize: 18)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
