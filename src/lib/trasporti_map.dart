import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/trasporti_orari.dart';

class MappaTrasporti extends StatelessWidget {
  final int indexLuogo;
  final int indexTrasporto;
  const MappaTrasporti({
    Key? key,
    required this.indexLuogo,
    required this.indexTrasporto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0XFF5BA942),
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                luoghi[indexLuogo].nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "${luoghi[indexLuogo].trasporti[indexTrasporto].tipo}: ${luoghi[indexLuogo].trasporti[indexTrasporto].linea} (${luoghi[indexLuogo].trasporti[indexTrasporto].azienda})",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Color(0XFF4C8F38),
              child: Icon(
                Icons.add_location_alt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: TrasportiMap(
        indexLuogo: indexLuogo,
        indexTrasporto: indexTrasporto,
      ),
    );
  }
}

class TrasportiMap extends StatefulWidget {
  final int indexLuogo;
  final int indexTrasporto;
  const TrasportiMap({
    Key? key,
    required this.indexLuogo,
    required this.indexTrasporto,
  }) : super(key: key);

  @override
  State<TrasportiMap> createState() => _TrasportiMapState();
}

class _TrasportiMapState extends State<TrasportiMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center:
            LatLng(luoghi[widget.indexLuogo].x, luoghi[widget.indexLuogo].y),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            ...List.generate(
              luoghi[widget.indexLuogo]
                  .trasporti[widget.indexTrasporto]
                  .fermate
                  .length,
              (index) => Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  luoghi[widget.indexLuogo]
                      .trasporti[widget.indexTrasporto]
                      .fermate[index]
                      .x,
                  luoghi[widget.indexLuogo]
                      .trasporti[widget.indexTrasporto]
                      .fermate[index]
                      .y,
                ),
                builder: (ctx) => IconButton(
                  icon: Badge(
                    position: BadgePosition.bottomEnd(),
                    badgeContent: Text("${index + 1}"),
                    child: const Icon(
                      Icons.directions_bus,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          child: TrasportiOrario(
                            indexLuogo: widget.indexLuogo,
                            indexTrasporto: widget.indexTrasporto,
                            indexFermata: index,
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
