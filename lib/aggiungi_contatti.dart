import 'package:flutter/material.dart';

class AggiungiContatti extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  const AggiungiContatti(
      {Key? key,
      required this.nextPage,
      required this.previewPage,
      required this.nomeLuogo})
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
          "Aggiungi contatti",
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
                    labelText: "Tipo",
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
                    labelText: "Contatto",
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
                    labelText: "Ulteriori informazioni",
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                ),
              ),
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
