import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_luogo.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';

import 'custom_flutter_map.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomFlutterMap(),
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
                    child: SizedBox(
                      height: 48,
                      child: TextField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          suffixIcon: SizedBox(
                            height: 48,
                            width: 48,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0XFF3D722D),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Text("Cerca..."),
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                        enabled: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn3",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPage(
                child: AggiungiLuogo(),
              ),
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
