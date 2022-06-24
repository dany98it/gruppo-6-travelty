import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/aggiungi_orario.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/orario.dart';
import 'package:travelty/trasporti.dart';
import 'package:travelty/trasporto.dart';

class AggiungiFermata extends StatelessWidget {
  final int indexLuogo;
  final int indexTrasporto;
  const AggiungiFermata({
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
              const Text(
                "Aggiungi fermata",
                style: TextStyle(
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
  List<Fermata> fermate = [];
  Fermata? fermata;

  List<Range> orari = [
    Range("00 : 00", "00 : 00"),
  ];

  double zoom = 13.0;

  MapController _mapController = MapController();

  addFermata(Fermata? f) {
    setState(() {
      fermata = f;
    });
  }

  addOrari(Range orario) {
    setState(() {
      orari.add(orario);
    });
  }

  clearOrari() {
    setState(() {
      orari = [
        Range("00 : 00", "00 : 00"),
      ];
    });
  }

  zoomIn() {
    setState(() {
      zoom += 0.5;
    });
  }

  zoomOut() {
    setState(() {
      zoom -= 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center:
            LatLng(luoghi[widget.indexLuogo].x, luoghi[widget.indexLuogo].y),
        zoom: zoom,
        onLongPress: (tp, ll) {
          addFermata(
            Fermata(
              fermate.length + 1,
              ll.latitude,
              ll.longitude,
              [],
            ),
          );
        },
        onMapCreated: (c) {
          _mapController = c;
        },
        enableScrollWheel: false,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            ...List.generate(
              fermate.length,
              (index) => Marker(
                key: Key("Fermata$index"),
                width: 80.0,
                height: 80.0,
                point: LatLng(fermate[index].x, fermate[index].y),
                builder: (ctx) => IconButton(
                  icon: Badge(
                    position: BadgePosition.bottomEnd(),
                    badgeContent: Text("${index + 1}"),
                    child: const Icon(
                      Icons.directions_bus,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            if (fermata != null)
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(fermata!.x, fermata!.y),
                builder: (ctx) => IconButton(
                  icon: Badge(
                    position: BadgePosition.bottomEnd(),
                    badgeContent: Text("${fermate.length + 1}"),
                    child: const Icon(
                      Icons.directions_bus,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {
                    addFermata(null);
                  },
                ),
              )
          ],
        ),
      ],
      nonRotatedChildren: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(183, 76, 143, 56),
                child: const Text(
                  "Per aggiungere una fermata tenere premuto",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      iconSize: 40,
                      onPressed: () {
                        zoomIn();
                        _mapController.move(_mapController.center, zoom);
                      },
                      icon: const Icon(
                        Icons.zoom_in,
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      onPressed: () {
                        zoomOut();
                        _mapController.move(_mapController.center, zoom);
                      },
                      icon: const Icon(
                        Icons.zoom_out,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              color: Colors.white,
            ),
            height: 160,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Aggiungi orari",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...List.generate(
                    orari.length,
                    (index) => Row(
                      key: Key("orari${fermate.length}$index"),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Arrivo"),
                        TimePicker(
                          onTimePick: (String time) {
                            orari[index].inizio = time;
                          },
                        ),
                        const Text("Partenza"),
                        TimePicker(
                          onTimePick: (String time) {
                            orari[index].fine = time;
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0XFF4C8F38),
                            ),
                            onPressed: () {
                              addOrari(
                                Range("00 : 00", "00 : 00"),
                              );
                            },
                            child: const Text(
                              "Aggiungi orario",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0XFF4C8F38),
                            ),
                            onPressed: () {
                              if (fermata != null) {
                                fermata!.orari.addAll(orari);
                                fermate.add(fermata!);
                              }
                              addFermata(null);
                              clearOrari();
                            },
                            child: const Text(
                              "Aggiungi fermata",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF4C8F38),
                        ),
                        onPressed: () {
                          if (fermata != null) {
                            fermata!.orari.addAll(orari);
                            fermate.add(fermata!);
                          }
                          luoghi[widget.indexLuogo]
                              .trasporti[widget.indexTrasporto]
                              .fermate
                              .addAll(fermate);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPage(
                                  child: TrasportiPage(
                                indexLuogo: widget.indexLuogo,
                              )),
                            ),
                          );
                        },
                        child: const Text(
                          "Termina",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
