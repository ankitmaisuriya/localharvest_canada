import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {}; // will hold farm markers
  String? _selectedFarm; // will hold farm markers;
  GoogleMapController? _mapController;

  // Default location (Toronto)
  final LatLng _initialPosition = const LatLng(21.2316, 72.8388);

  final List<Map<String, dynamic>> farms = [
    {'id': 'farm_1', 'name': 'Shri Ram Farm', 'lat': 21.2350, 'lng': 72.8400},
    {'id': 'farm_2', 'name': 'Khodiyar Farm', 'lat': 21.2300, 'lng': 72.8350},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var farm in farms) {
      _markers.add(
        Marker(
          markerId: MarkerId(farm['id']),
          position: LatLng(farm['lat'], farm['lng']),
          infoWindow: InfoWindow(title: farm['name']),
          onTap: () {
            _mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(farm['lat'], farm['lng']),
                  zoom: 16,
                  bearing: 45, // rotation in degrees
                  tilt: 30, // tilt the camera
                ),
              ),
            );
            setState(() {
              _selectedFarm = farm['name'];
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nearby Farms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 13,
            ),
            markers: _markers,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 6),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.category, color: Colors.green),
                  const SizedBox(width: 8),
                  const Text(
                    'Vegetables', // Replace with dynamic category if needed
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.green),
                    onPressed: () {
                      // TODO: Open filter or category selection
                    },
                  ),
                ],
              ),
            ),
          ),

          _buildFarmCard(),
        ],
      ),
    );
  }

  Widget _buildFarmCard() {
    // If no farm selected, hide card
    if (_selectedFarm == null) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 140,
        margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12)],
        ),
        child: Row(
          children: [
            // Farm image placeholder
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.agriculture,
                size: 40,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 16),

            // Farm details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedFarm!, // farm name from marker tap
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Fresh vegetables & fruits',
                    // placeholder category/description
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 4),
                      const Text('2.1 km away'), // placeholder distance
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // handle view farm action
                        },
                        child: const Text('View'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
