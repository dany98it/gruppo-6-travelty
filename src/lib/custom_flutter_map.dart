import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/info_luogo.dart';

class CustomFlutterMap extends StatefulWidget {
  final Function nextPage;
  final Function previewPage;

  const CustomFlutterMap({
    Key? key,
    required this.nextPage,
    required this.previewPage,
  }) : super(key: key);

  @override
  State<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends State<CustomFlutterMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.8902300, 12.4922260),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(41.8902300, 12.4922260),
              builder: (ctx) => IconButton(
                icon: const Icon(
                  Icons.account_balance,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {
                  widget.nextPage(
                    InfoLuogo(
                      nextPage: widget.nextPage,
                      previewPage: widget.previewPage,
                      nomeLuogo: "Colosseo",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
