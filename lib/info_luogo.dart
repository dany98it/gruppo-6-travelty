import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelty/accessibilita.dart';
import 'package:travelty/contatti.dart';
import 'package:travelty/galleria.dart';
import 'package:travelty/orari.dart';
import 'package:travelty/traporti.dart';

class InfoLuogo extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;

  const InfoLuogo({
    Key? key,
    required this.nextPage,
    required this.previewPage,
    required this.nomeLuogo,
  }) : super(key: key);

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
      body: TopElements(
        nextPage: nextPage,
        previewPage: previewPage,
        nomeLuogo: nomeLuogo,
      ),
    );
  }
}

class TopElements extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;

  const TopElements({
    Key? key,
    required this.nextPage,
    required this.previewPage,
    required this.nomeLuogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            InkWell(
              onTap: () {
                nextPage(
                  GalleriaPage(
                    nextPage: nextPage,
                    previewPage: previewPage,
                    nomeLuogo: nomeLuogo,
                  ),
                );
              },
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/1920px-Colosseo_2020.jpg",
              ),
            ),
            const Positioned(
              top: 5,
              left: 5,
              child: Icon(
                Icons.report_problem,
                color: Color(0XFFFFC700),
                size: 40,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: const Color(0X80FFFFFF),
                radius: 23,
                child: IconButton(
                  onPressed: () {
                    nextPage(
                      AccessibilitaPage(
                        nextPage: nextPage,
                        previewPage: previewPage,
                        nomeLuogo: nomeLuogo,
                      ),
                    );
                  },
                  iconSize: 30,
                  icon: const Icon(
                    Icons.accessible,
                    color: Color(0XFFFF0000),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: const Color(0XE65BA942),
                child: const Text(
                  "indirizzo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListTile(
          title: Center(
            child: RatingBarIndicator(
              rating: 3,
              itemSize: 40,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Color(0XFFF6E018),
              ),
              unratedColor: const Color(0XFFC4C4C4),
            ),
          ),
          trailing: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.directions_bus,
              color: Color(0XFF4C8F38),
            ),
            onPressed: () {
              nextPage(
                TrasportiPage(
                  nextPage: nextPage,
                  previewPage: previewPage,
                  nomeLuogo: nomeLuogo,
                ),
              );
            },
          ),
          leading: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.phone,
              color: Color(0XFF4C8F38),
            ),
            onPressed: () {
              nextPage(
                ContattiPage(
                  nextPage: nextPage,
                  previewPage: previewPage,
                  nomeLuogo: nomeLuogo,
                ),
              );
            },
          ),
        ),
        ListTile(
          leading: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.calendar_month,
              color: Color(0XFF4C8F38),
            ),
            onPressed: () {
              nextPage(
                OrariPage(
                  nextPage: nextPage,
                  previewPage: previewPage,
                  nomeLuogo: nomeLuogo,
                ),
              );
            },
          ),
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text("CHIUSO"),
                    Text("Mercoledì"),
                  ],
                ),
              ),
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text("08:00-13:00"),
                    Text("14:00-23:00"),
                  ],
                ),
              )
            ],
          ),
        ),
        const RecensioneForm(),
        for (int i = 0; i < 20; i++)
          RecensioneItem(
            key: Key("Account$i"),
          ),
      ],
    );
  }
}

class RecensioneForm extends StatelessWidget {
  const RecensioneForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: const Color(0XFFF4F4F4),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0XFFB9B9B9),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Material(
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
                    suffixIcon: SelectPericoloLevel(),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                "Valuta:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              title: Center(
                child: RatingBar.builder(
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Color(0XFFF6E018),
                    size: 40,
                  ),
                  onRatingUpdate: (double value) {},
                  unratedColor: const Color(0XFFC4C4C4),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  size: 40,
                  color: Color(0XFF4C8F38),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectPericoloLevel extends StatefulWidget {
  const SelectPericoloLevel({Key? key}) : super(key: key);

  @override
  State<SelectPericoloLevel> createState() => _SelectPericoloLevelState();
}

class _SelectPericoloLevelState extends State<SelectPericoloLevel> {
  Color selectColor = Colors.green;

  void change(newColor) {
    setState(() {
      selectColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => change(value),
      icon: Icon(
        Icons.report_problem,
        color: selectColor,
        size: 40,
      ),
      padding: const EdgeInsets.only(right: 5),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: Colors.red,
          child: Icon(
            Icons.report_problem,
            color: Colors.red,
            size: 40,
          ),
        ),
        const PopupMenuItem(
          value: Colors.orange,
          child: Icon(
            Icons.report_problem,
            color: Colors.orange,
            size: 40,
          ),
        ),
        const PopupMenuItem(
          value: Colors.green,
          child: Icon(
            Icons.report_problem,
            color: Colors.green,
            size: 40,
          ),
        )
      ],
    );
  }
}

class RecensioneItem extends StatefulWidget {
  const RecensioneItem({Key? key}) : super(key: key);

  @override
  State<RecensioneItem> createState() => _RecensioneItemState();
}

class _RecensioneItemState extends State<RecensioneItem> {
  int vote = 0;

  upVote() {
    setState(() {
      vote = vote + 1;
    });
  }

  downVote() {
    setState(() {
      vote = vote - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flex(
          direction: Axis.vertical,
          children: [
            IconButton(
              onPressed: () {
                upVote();
              },
              icon: const Icon(Icons.arrow_drop_up),
            ),
            Text(vote.toString()),
            IconButton(
              onPressed: () {
                downVote();
              },
              icon: const Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
        Expanded(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: const [
                      CircleAvatar(
                        radius: 12,
                        child: Icon(
                          Icons.person,
                          size: 15,
                        ),
                      ),
                      Text(
                        "Utente x",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  RatingBarIndicator(
                    rating: 3,
                    itemSize: 15,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Color(0XFFF6E018),
                    ),
                    unratedColor: const Color(0XFFC4C4C4),
                  ),
                ],
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              ),
            ],
          ),
        ),
        const Icon(
          Icons.report_problem,
          color: Colors.orange,
          size: 50,
        )
      ],
    );
  }
}
