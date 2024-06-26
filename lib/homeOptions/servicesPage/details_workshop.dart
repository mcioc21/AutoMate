import 'package:automate/homeOptions/servicesPage/book_appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:automate/baseFiles/classes/workshop.dart';

class DetailsWorkshopPage extends StatelessWidget {
  final Workshop workshop;

  const DetailsWorkshopPage({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${workshop.name} Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(workshop.photo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2, // Give more space to the details
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(workshop.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        const SizedBox(height: 30),
                        Text(workshop.description, textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey[600]),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(workshop.address.isNotEmpty ? workshop.address : "No address provided", style: TextStyle(color: Colors.grey[600]),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2, // Give more space to the map
                  child: 
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(workshop.latitude, workshop.longitude),
                      zoom: 12,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId(workshop.id.toString()),
                        position: LatLng(workshop.latitude, workshop.longitude),
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:2.0, bottom: 16.0, left: 16.0, right: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentPage(workshop: workshop),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Ensures the button is easily tappable
              ),
              child: const Text("Book an appointment with this workshop"),
            ),
          ),
        ],
      ),
    );
  }
}
