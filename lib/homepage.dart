// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("BialAirwayCompanion"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(13.199770578307152, 77.69022188791145), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(13.199770578307152, 77.69022188791145), zoom: zoomVal)));
  }

  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://photos.app.goo.gl/rZtE6BDomgcmehQj8",
                  13.191745788526703, 77.66970151983223,"Airport Residency"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  13.183267274212731, 77.751161867493,"Shree Aavalakondaraya \n Swami Temple"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  13.198620061593344, 77.70382654447656,"BIAL Airport"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        // ignore: avoid_unnecessary_containers
        child:Container(
              child: new FittedBox(
                // ignore: duplicate_ignore
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    // ignore: prefer_const_constructors
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        // SizedBox(height:5.0),
        // ignore: avoid_unnecessary_containers
        // Container(
        //       child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //           child: Text(
        //         "4.1",
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontSize: 18.0,
        //         ),
        //       )),
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //         child: Icon(
        //           FontAwesomeIcons.solidStar,
        //           color: Colors.amber,
        //           size: 15.0,
        //         ),
        //       ),
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //         child: Icon(
        //           FontAwesomeIcons.solidStar,
        //           color: Colors.amber,
        //           size: 15.0,
        //         ),
        //       ),
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //         child: Icon(
        //           FontAwesomeIcons.solidStar,
        //           color: Colors.amber,
        //           size: 15.0,
        //         ),
        //       ),
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //         child: Icon(
        //           FontAwesomeIcons.solidStar,
        //           color: Colors.amber,
        //           size: 15.0,
        //         ),
        //       ),
        //       // ignore: avoid_unnecessary_containers
        //       Container(
        //         child: Icon(
        //           FontAwesomeIcons.solidStarHalf,
        //           color: Colors.amber,
        //           size: 15.0,
        //         ),
        //       ),
        //        // ignore: avoid_unnecessary_containers
        //        Container(
        //           child: Text(
        //         "(946)",
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontSize: 18.0,
        //         ),
        //       )),
        //     ],
        //   )),
        //   SizedBox(height:5.0),
        // // ignore: avoid_unnecessary_containers
        // Container(
        //           child: Text(
        //         "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontSize: 18.0,
        //         ),
        //       )),
        //       SizedBox(height:5.0),
        // // ignore: avoid_unnecessary_containers
        // Container(
        //     child: Text(
        //   "Closed \u00B7 Opens 17:00 Thu",
        //   style: TextStyle(
        //       color: Colors.black54,
        //       fontSize: 18.0,
        //       fontWeight: FontWeight.bold),
        // )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(13.199616668128169, 77.70573449308962), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('residency'),
  position: LatLng(13.191745788526703, 77.66970151983223),
  infoWindow: InfoWindow(title: 'Airport Residency'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('temple'),
  position: LatLng(13.183267274212731, 77.751161867493),
  infoWindow: InfoWindow(title: 'Shree Aavalakondaraya Swami Temple'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bialairport'),
  position: LatLng(13.198620061593344, 77.70382654447656),
  infoWindow: InfoWindow(title: 'BIAL Airport'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);

//Bangalore

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(13.191745788526703, 77.66970151983223),
  infoWindow: InfoWindow(title: 'Airport Residency'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(13.183267274212731, 77.751161867493),
  infoWindow: InfoWindow(title: 'Shree Aavalakondaraya Swami Temple'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(13.198620061593344, 77.70382654447656),
  infoWindow: InfoWindow(title: 'BIAL Network'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);