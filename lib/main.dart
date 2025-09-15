import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:latlong2/latlong.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await initHiveForFlutter();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});

MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  FlutterMap(
      mapController: mapController,
    options: MapOptions(
      initialCenter: LatLng(33.5132, 36.2768), // Center the map over London
      initialZoom: 20,
    ),
    children: [
      TileLayer( // Bring your own tiles
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
        userAgentPackageName: 'com.graph.app', // Add your app identifier
        // And many more recommended properties!
      ),
      
    ],
  ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      print(mapController.camera.center);
    }),
    );
  }
}