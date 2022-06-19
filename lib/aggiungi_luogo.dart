import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelty/card_picture.dart';

class AggiungiLuogo extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String luogo = "";
  final ImagePicker _picker = ImagePicker();
  AggiungiLuogo({Key? key, required this.nextPage, required this.previewPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            previewPage();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0XFF5BA942),
        title: const Text(
          "Aggiungi luogo",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
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
                    enabled: false,
                    labelText: "Seleziona sulla mappa",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundColor: Color(0XFF1E3916),
                        child: Icon(
                          Icons.add_location_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
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
                _picker.pickImage(source: ImageSource.gallery);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFF4C8F38),
                ),
                onPressed: () {},
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
