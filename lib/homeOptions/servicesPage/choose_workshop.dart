import 'package:automate/baseFiles/app_theme.dart';
import 'package:automate/homeOptions/servicesPage/map.dart';
import 'package:flutter/material.dart';

class ChooseWorkshopPage extends StatelessWidget {
  const ChooseWorkshopPage({super.key});

  @override
  Widget build(BuildContext context) {

    void navigateToMap(String category) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapPage(category: category),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Workshop",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Pick a category:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          WorkshopButton(
            title: "Repair Shop",
            description: "General service shops for all types of repair.",
            onPressed: () => navigateToMap("Repair"),
          ),
          WorkshopButton(
            title: "Detailing",
            description: "Specialized in detailing and cosmetic services.",
            onPressed: () => navigateToMap("Detailing"),
          ),
          WorkshopButton(
            title: "Tyre Shop",
            description: "Focused on tyres and wheel services.",
            onPressed: () => navigateToMap("Tyre"),
          ),
        ],
      ),
    );
  }
}

class WorkshopButton extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const WorkshopButton({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.snow,
          backgroundColor: AppColors.blue, // Text color
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(description,
                style: const TextStyle(fontSize: 14, color: Colors.amber)),
          ],
        ),
      ),
    );
  }
}
