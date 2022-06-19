import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleriaPage extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  final ImagePicker _picker = ImagePicker();

  GalleriaPage(
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
        title: Text(
          nomeLuogo,
          style: const TextStyle(
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
                Icons.place,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _picker.pickImage(source: ImageSource.gallery);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.add_location_alt),
      ),
      body: const Galleria(),
    );
  }
}

class Galleria extends StatefulWidget {
  const Galleria({Key? key}) : super(key: key);

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
        25,
        (index) => Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/1920px-Colosseo_2020.jpg",
        ),
      ),
    );
  }
}
