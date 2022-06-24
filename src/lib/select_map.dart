import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/aggiungi_luogo.dart';
import 'package:travelty/main.dart';

class SelectPunto extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  const SelectPunto({
    Key? key,
    required this.nextPage,
    required this.previewPage,
    required this.nomeLuogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectMap(
        nomeLuogo: nomeLuogo,
      ),
    );
  }
}

class SelectMap extends StatefulWidget {
  final String nomeLuogo;

  const SelectMap({
    Key? key,
    required this.nomeLuogo,
  }) : super(key: key);

  @override
  State<SelectMap> createState() => _SelectMapState();
}

class _SelectMapState extends State<SelectMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: position != null
            ? LatLng(position!.latitude, position!.longitude)
            : LatLng(41.8902300, 12.4922260),
        zoom: 13.0,
        onLongPress: (tp, ll) {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(
                tp.global.dx, tp.global.dy, tp.global.dx + 1, tp.global.dy + 1),
            items: [
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 0,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.school,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 1,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.church,
                      color: Colors.brown.shade900,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 2,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.restaurant,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 3,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.account_balance,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 4,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.train,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 5,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.hotel,
                      color: Colors.pink.shade300,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 6,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.local_hospital,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(
                            child: AggiungiLuogo(
                              luogo: ll,
                              icon: 7,
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
      ],
      nonRotatedChildren: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(183, 76, 143, 56),
            child: const Text(
              "Per selezionare un luogo sulla mappa tenere premuto",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
