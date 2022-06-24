import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travelty/profilo.dart';
import 'package:travelty/setting.dart';

import 'home.dart';

Position? position;
void main() {
  Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation)
      .then(
    (value) {
      position = value;
      runApp(const CustomContainer(child: Home()));
    },
  );
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({Key? key, required this.child}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travelty',
      theme: ThemeData(
        useMaterial3: true,
        bottomAppBarColor: const Color.fromARGB(255, 91, 169, 66),
      ),
      home: MyPage(
        child: child,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  final Widget child;
  const MyPage({Key? key, required this.child}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Widget currentPage;
  var navigation = ListQueue<Widget>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: FloatingActionButton.large(
          heroTag: "btn5",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyPage(
                  child: Home(),
                ),
              ),
            );
          },
          tooltip: 'home',
          shape: const CircleBorder(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: const Color(0XFF3D722D),
          child: const Icon(
            Icons.map,
            size: 48,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: Key("bnb"),
        backgroundColor: const Color(0XFF5BA942),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.settings),
                iconSize: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyPage(
                        child: Setting(),
                      ),
                    ),
                  );
                },
              ),
              label: "Setting"),
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 10,
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              iconSize: 40,
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage(
                      child: Profilo(),
                    ),
                  ),
                );
              },
            ),
            label: "Profilo",
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
