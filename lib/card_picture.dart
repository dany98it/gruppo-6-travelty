import 'dart:io';
import 'package:flutter/material.dart';

class CardPicture extends StatelessWidget {
  const CardPicture({Key? key, required this.onTap, this.imagePath})
      : super(key: key);

  final Function() onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (imagePath != null) {
      return Card(
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(10.0),
          width: size.width * .70,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            image: DecorationImage(
                fit: BoxFit.cover, image: FileImage(File(imagePath as String))),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3.0, 3.0),
                      blurRadius: 2.0,
                    )
                  ],
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete, color: Colors.white)),
              )
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0XFFC4C4C4),
          ),
          width: size.width,
          height: size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_a_photo,
                  color: Color(0XFF545454),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
