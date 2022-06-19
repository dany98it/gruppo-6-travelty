import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_luogo.dart';

import 'custom_flutter_map.dart';

class Home extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  const Home({Key? key, required this.nextPage, required this.previewPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomFlutterMap(
            nextPage: nextPage,
            previewPage: previewPage,
          ),
          Positioned(
            top: 50,
            right: 15,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                          suffixIcon: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Color(0XFF3D722D),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0)),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          hintText: "Cerca..."),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextPage(
            AggiungiLuogo(
              nextPage: nextPage,
              previewPage: previewPage,
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.add_location_alt),
      ),
    );
  }
}
