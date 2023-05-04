import 'dart:async';
import 'dart:io';
import 'package:blood_bank_app/bloodstock.dart';
import 'package:blood_bank_app/src/BloodBank.dart';
import 'package:blood_bank_app/src/HttpService.dart';
import 'package:blood_bank_app/src/WestBengalJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'drawer.dart';
class home extends StatefulWidget {
  @override
  _home createState() => _home();
}
class _home extends State<home> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  Set<Polygon> poly_list =new Set();
  Set<Marker> marker_list =new Set();
  bool _is_internet_connected = false;
  @override
  void initState() {
    super.initState();
    addPolygons();
    CheckInternetConnection().then((value) async {
      if(_is_internet_connected){
        showProgress(context);
        try {
          await GetBloodBank("0");
        }
        catch(Exception){

        }
        finally{
          Navigator.pop(context);
        }
      }else{
        showAlertDialogInternet(context,"Error","Internet connection not available. Please connect internet");
      }
    });

  }
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.6, 87.9),
    zoom: 6.9,
  );

  static const CameraPosition _kLake = CameraPosition(
    target: LatLng(24.6, 87.9),
    zoom: 6.9,);
  addPolygons() {
    for (var i = 0; i < WestBengalJson.WB.length; i++) {
      String polName = '' + i.toString();
      List<LatLng> point = [];
      for (var j = 0; j< WestBengalJson.WB[i].length; j++) {
        var obj = WestBengalJson.WB[i];
        var latLang = LatLng(obj[j][1], obj[j][0]);
        point.add(latLang);
      }
      List< Polygon > addPolygon = [
        Polygon(
          polygonId: PolygonId(polName),
          points: point,
          consumeTapEvents: true,
          strokeColor: Color(0xff3d79b6),
          strokeWidth: 3,
        ),
      ];
      poly_list.addAll(addPolygon);
    }
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLOOD BANK"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
          polygons: poly_list,
          markers: marker_list,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Recenter!'),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //drawer: drawer(''),
    );
  }
  Future<void> GetBloodBank(String recType)   async {
    final HttpService httpService = HttpService();
    List<BloodBank> list= await httpService.getBloodBanks(recType);
    setState(() {
      for (var i = 0; i < list.length; i++) {
        String str = 'Address : ${list[i].address}\nPin code : ${list[i].pincode}\n';
        List<Marker> addMarker = [
          Marker(
            markerId: MarkerId(list[i].branchId.toString()),
            position: LatLng(
              list[i].latitude,
              list[i].longitude,
            ),
              infoWindow: InfoWindow(title: list[i].fullNameOfBloodBank, snippet: str,onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => bloodstock(list[i].branchId.toString(),list[i].fullNameOfBloodBank.toString(),list[i].address.toString(),list[i].pincode.toString())));
              }, ),
            onTap: () {
              //_onMarkerTapped(markerId);
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (context) => new bloodstock(list[i].branchId.toString(),list[i].fullNameOfBloodBank.toString(),list[i].address.toString(),list[i].pincode.toString())));
            },
          ),
        ];
        marker_list.addAll(addMarker);
  }
});

  }
  Future CheckInternetConnection()
  async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _is_internet_connected = true;
      }
    } on SocketException catch (_) {
      _is_internet_connected = false;
    }
  }

  showAlertDialogInternet(BuildContext context, String title,String content) {

    // set up the buttons
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showProgress(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Please wait .." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

}