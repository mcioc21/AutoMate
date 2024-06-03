import 'package:automate/homeOptions/vehicleOptions/fuel_type.dart';

class Vehicle {
  final String? uid;
  final String make;
  final String model;
  final String vinNumber;
  final FuelType fuelType;
  bool isDefault; // New attribute for default status

  Vehicle({
    this.uid,
    required this.make,
    required this.model,
    required this.vinNumber,
    required this.fuelType,
    this.isDefault = false, // Default value for isDefault
  });

  // Convert a map to a Vehicle object
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      uid: map['uid'] ?? '',
      make: map['make'] ?? '',
      model: map['model'] ?? '',
      vinNumber: map['vinNumber'] ?? '',
      fuelType: FuelType.values.byName(map['fuelType'] ?? 'Petrol'), // Default to 'Petrol' if not specified
      isDefault: map['isDefault'] ?? false, // Default to false if not specified
    );
  }

  // Convert a Vehicle object to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'make': make,
      'model': model,
      'vinNumber': vinNumber,
      'fuelType': fuelType.name,
      'isDefault': isDefault, // Include isDefault in the map
    };
  }

  // Convert a list of Vehicles to a list of maps
  static List<Map<String, dynamic>> toMapList(List<Vehicle> vehicles) {
    return vehicles.map((vehicle) => vehicle.toMap()).toList();
  }

  // Convert a list of maps to a list of Vehicles
  static List<Vehicle> fromMapList(List<dynamic> maps) {
    return maps.map((map) => Vehicle.fromMap(map as Map<String, dynamic>)).toList();
  }
}