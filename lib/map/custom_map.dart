import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(31.768319, 35.213710);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
Set <Marker> markers={};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          markers: markers,
          onTap: (LatLng value){
          _center=value;
          markers.add(Marker(markerId: MarkerId('Jersusalem+${value.longitude}'),position: value));
          setState(() {});
          print(value.longitude);
          print(value.longitude);
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}