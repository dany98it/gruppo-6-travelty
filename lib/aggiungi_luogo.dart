import 'package:flutter/material.dart';

class AggiungiLuogo extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String luogo = "";
  const AggiungiLuogo(
      {Key? key, required this.nextPage, required this.previewPage})
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
      body: Flex(
        direction: Axis.vertical,
        children: [],
      ),
    );
  }
}
