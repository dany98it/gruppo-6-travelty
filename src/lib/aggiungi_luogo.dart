import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/card_picture.dart';
import 'package:travelty/home.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/select_map.dart';

class AggiungiLuogo extends StatelessWidget {
  final LatLng? luogo;
  String nome = "";
  List<Uint8List> images = [];
  final ImagePicker _picker = ImagePicker();
  final int? icon;
  AggiungiLuogo({
    Key? key,
    this.luogo,
    this.icon,
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
        title: const Center(
          child: Text(
            "Aggiungi luogo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
      body: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            const Center(
              child: Text(
                "Indirizzo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 13,
                borderRadius: BorderRadius.circular(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      surfaceTintColor: Colors.white,
                      minimumSize: const Size(double.infinity, 70)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          child: SelectMap(
                            nomeLuogo: luogo != null ? luogo.toString() : "",
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (luogo == null)
                            ? "Seleziona sulla mappa"
                            : luogo!.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0XFF1E3916),
                        child: Icon(
                          Icons.add_location_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 13,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  onChanged: (value) {
                    nome = value;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.newline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Nome",
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Immagine di copertina",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CardPicture(
              onTap: () {
                _picker
                    .pickImage(source: ImageSource.gallery)
                    .asStream()
                    .forEach((element) {
                  if (element!.mimeType!.contains("image/jpeg")) {
                    element.readAsBytes().asStream().forEach((element1) {
                      images.add(element1);
                    });
                  }
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFF4C8F38),
                ),
                onPressed: () {
                  luoghi.add(
                    Luogo.withImage(
                        icon!,
                        luogo!.latitude,
                        luogo!.longitude,
                        nome,
                        luogo.toString(),
                        0,
                        0,
                        [],
                        [],
                        [],
                        [],
                        0,
                        [],
                        images),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyPage(
                        child: Home(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Conferma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
