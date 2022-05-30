import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomFlutterMap extends StatelessWidget {
  const CustomFlutterMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(41.8902300, 12.4922260),
        zoom: 13.0,
      ),
      layers: [
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
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
              width: 80.0,
              height: 80.0,
              point: LatLng(41.8902300, 12.4922260),
              builder: (ctx) => IconButton(
                icon: const Icon(
                  Icons.account_balance,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {},
              ),
            ),
          ],
        )),
      ],
    );
  }
}
