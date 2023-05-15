// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/modules/check_out/check_out_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class CostomGoogleMap extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<CostomGoogleMap> {
  final LatLng _initialcameraposition =const LatLng(20.5937, 78.9629);
  GoogleMapController? controller;
  final Location _location = Location();
  void _onMapCreated(GoogleMapController _value) {
    controller = _value;
    _location.onLocationChanged.listen((event) {
      // controller!.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //         target: LatLng(event.latitude, event.longitude), zoom: 15),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialcameraposition,
                ),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(right: 60, left: 10, bottom: 40, top: 40),
                  child: MaterialButton(
                    onPressed: () async {
                      await _location.getLocation().then((value) {
                        setState(() {
                          checkoutProvider.setLoaction = value;
                        });
                      });
                      Navigator.pop(context);
                    },
                    color: AppColors.kappBarColorlight,
                    shape:const StadiumBorder(),
                    child:const Text("Set Location"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
