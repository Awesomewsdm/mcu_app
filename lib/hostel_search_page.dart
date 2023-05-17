import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.0883235707892),
  zoom: 14.4746,
);

// Set<Marker> _createMarkers (){
//   return
// }

Set<Marker> markers = {};
  GoogleMapController? controller;

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Search"),
      ),
      body: GoogleMap(
         myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 1,
        ),
        mapType: MapType.normal,
        markers: markers,
        onMapCreated: ((mapController) {
          setState(() {
            controller = mapController;
          });
        }),
      ),
      // {
      //     const Marker(
      //       markerId: MarkerId("Marker"),
      //       position: LatLng(37.42796133580664, -122.0883235707892),
      //     )
      //   },
       
      //   onMapCreated: (controller) {
      //     _controller.complete(controller);
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final lat = (Random().nextDouble() * 180) - 90;
          final lng = (Random().nextDouble() * 360) - 180;
          final title = "title${Random().nextInt(1000)}";

          markers
              .addLabelMarker(
                LabelMarker(
            label: title,
            markerId: const MarkerId("idString"),
            position: LatLng(lat, lng),
            backgroundColor: Colors.green,
          ))
              .then(
            (value) {
              setState(() {});
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
