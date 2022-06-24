import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/info_luogo.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';

final List<Icon> _icons = [
  Icon(
    Icons.school,
    color: Colors.blue.shade900,
  ),
  Icon(
    Icons.church,
    color: Colors.brown.shade900,
  ),
  const Icon(
    Icons.restaurant,
    color: Colors.orange,
  ),
  const Icon(
    Icons.account_balance,
    color: Colors.purple,
  ),
  Icon(
    Icons.train,
    color: Colors.green.shade900,
  ),
  Icon(
    Icons.hotel,
    color: Colors.pink.shade300,
  ),
  const Icon(
    Icons.local_hospital,
    color: Colors.red,
  ),
  Icon(
    Icons.location_on,
    color: Colors.grey.shade800,
  ),
];

class CustomFlutterMap extends StatefulWidget {
  const CustomFlutterMap({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends State<CustomFlutterMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: position != null
            ? LatLng(position!.latitude, position!.longitude)
            : LatLng(41.8902300, 12.4922260),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            if (position != null)
              Marker(
                point: LatLng(position!.latitude, position!.longitude),
                builder: (ctx) => const Icon(
                  Icons.person_pin_circle_rounded,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ...List.generate(
              luoghi.length,
              (index) => Marker(
                key: Key("MarkerHome$index"),
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  luoghi[index].x,
                  luoghi[index].y,
                ),
                builder: (ctx) => IconButton(
                  icon: _icons[luoghi[index].icon],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          child: InfoLuogo(
                            indexLuogo: index,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
