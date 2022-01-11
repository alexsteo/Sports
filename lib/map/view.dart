import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'logic.dart';

class MapPage extends StatelessWidget {
  final logic = Get.put(MapLogic());
  final state = Get.find<MapLogic>().state;

  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(center: LatLng(46.756490, 23.593498), zoom: 13.0),
        children: <Widget>[
          TileLayerWidget(
              options: TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'])),
          MarkerLayerWidget(
              options: MarkerLayerOptions(
            markers: [
              Marker(
                width: 100.0,
                height: 100.0,
                point: LatLng(46.756490, 23.593498),
                builder: (ctx) => Container(
                  child: IconButton(
                    icon: Chip(
                      label: Text('fotball'),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: Get.back,
                  ),
                ),
              ),Marker(
                width: 120.0,
                height: 100.0,
                point: LatLng(46.769490, 23.594498),
                builder: (ctx) => Container(
                  child: IconButton(
                    icon: Chip(
                      label: Text('Chess in the park'),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: Get.back,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
