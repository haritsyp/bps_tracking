import 'dart:async';

import 'package:bps_tracking/ui/detail_laporan_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsLaporPage extends StatefulWidget {
  @override
  State<MapsLaporPage> createState() => MapLaporState();
}

class MapLaporState extends State<MapsLaporPage> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _newPosition;
  Marker _marker;
  LatLng _latLng;
  final Set<Marker> _markers = {};
  var fontJudul = TextStyle(
    fontFamily: 'Asap',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    color: Colors.black,
  );
  var normalText = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  void checkServices() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print("_locationData =>");
    print(_locationData);
    _newPosition = CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 15
    );
    
    print("_latLng =>");
    print(_latLng);
    /* _marker = Marker(
      markerId: MarkerId('0'),
      position: _latLng,
      icon: BitmapDescriptor.defaultMarker,
    ); */
    setState(() {
      _latLng = LatLng(_locationData.latitude, _locationData.longitude);
    });
    //print(_markers);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_newPosition));
  }
  Future<CameraPosition> getPosition() async{
    _locationData = await location.getLocation();
    CameraPosition _newPosition = CameraPosition(
      target: LatLng(_locationData.latitude, _locationData.longitude),
      zoom: 15
    );
    return _newPosition;
  }
  
  @override
  void initState() {
    super.initState();
    checkServices();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    
    /* _marker = Marker(
      markerId: MarkerId('0'),
      position: _latLng,
      /* infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ), */
      icon: BitmapDescriptor.defaultMarker,
    );
    _markers.add(_marker); */
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kirim Lokasi',style: fontJudul,),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          // markers: Set.from(_markers),
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        /* floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ), */
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget>[
            Container(
              width: mediaQuery.size.width - 50,
              child: FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LaporKegiatanPage()));
                  Navigator.of(context).pushNamed('/lapor');
                },
                heroTag: 0,
                label: Text('TETAPKAN LOKASI'),
                // icon: Icon(Icons.fingerprint),
                backgroundColor: Colors.red[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
              )
            ),
            SizedBox(
              height: 5
            ),
            Container(
              width: mediaQuery.size.width - 50,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                },
                heroTag: 1,
                label: Text('KEMBALI', style: TextStyle(color: Colors.red[300]),),
                // icon: Icon(Icons.fingerprint),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
              ),
            )
          ]
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      )
    );
  }

}