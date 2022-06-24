import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelty/luogo.dart';

class GalleriaPage extends StatefulWidget {
  final int indexLuogo;

  const GalleriaPage({
    Key? key,
    required this.indexLuogo,
  }) : super(key: key);

  @override
  State<GalleriaPage> createState() => _GalleriaPageState();
}

class _GalleriaPageState extends State<GalleriaPage> {
  final ImagePicker _picker = ImagePicker();

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
                luoghi[widget.indexLuogo].nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Text(
                "Galleria",
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
                Icons.place,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          _picker
              .pickImage(source: ImageSource.gallery)
              .asStream()
              .forEach((element) {
            if (element!.mimeType!.contains("image/jpeg")) {
              element.readAsBytes().asStream().forEach((element1) {
                setState(() {
                  luoghi[widget.indexLuogo].images.add(element1);
                });
              });
            }
          });
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.add_a_photo),
      ),
      body: Galleria(
        indexLuogo: widget.indexLuogo,
      ),
    );
  }
}

class Galleria extends StatefulWidget {
  final int indexLuogo;
  const Galleria({Key? key, required this.indexLuogo}) : super(key: key);

  @override
  State<Galleria> createState() => _GalleriaState();
}

class _GalleriaState extends State<Galleria> {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(
        luoghi[widget.indexLuogo].images.length,
        (index) => Image.memory(
          luoghi[widget.indexLuogo].images[index],
        ),
      ),
    );
  }
}
