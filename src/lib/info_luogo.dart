import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelty/accessibilita.dart';
import 'package:travelty/contatti.dart';
import 'package:travelty/galleria.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/orari.dart';
import 'package:travelty/orario.dart';
import 'package:travelty/recensione.dart';
import 'package:travelty/trasporti.dart';
import 'package:travelty/utente.dart';

class InfoLuogo extends StatelessWidget {
  final int indexLuogo;

  const InfoLuogo({
    Key? key,
    required this.indexLuogo,
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
        title: Center(
          child: Text(
            luoghi[indexLuogo].nome,
            style: const TextStyle(
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
                Icons.place,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: TopElements(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class TopElements extends StatefulWidget {
  final int indexLuogo;

  const TopElements({
    Key? key,
    required this.indexLuogo,
  }) : super(key: key);

  @override
  State<TopElements> createState() => _TopElementsState();
}

class _TopElementsState extends State<TopElements> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPage(
                      child: GalleriaPage(
                        indexLuogo: widget.indexLuogo,
                      ),
                    ),
                  ),
                );
              },
              child: Center(
                child: luoghi[widget.indexLuogo].images.isEmpty
                    ? Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/5/5f/Universit%C3%A0_Salerno.jpg",
                        height: 327.8,
                      )
                    : Image.memory(
                        luoghi[widget.indexLuogo].images.first,
                        height: 327.8,
                      ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Icon(
                Icons.report_problem,
                color: luoghi[widget.indexLuogo].recensioni.isNotEmpty
                    ? luoghi[widget.indexLuogo].recensioni.first.pericolo == 1
                        ? Colors.green
                        : luoghi[widget.indexLuogo].recensioni.first.pericolo ==
                                2
                            ? Colors.orange
                            : luoghi[widget.indexLuogo]
                                        .recensioni
                                        .first
                                        .pericolo ==
                                    3
                                ? Colors.red
                                : Colors.grey
                    : Colors.grey,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPage(
                          child: AccessibilitaPage(
                            indexLuogo: widget.indexLuogo,
                          ),
                        ),
                      ),
                    );
                  },
                  iconSize: 30,
                  icon: Icon(
                    Icons.accessible,
                    color: luoghi[widget.indexLuogo].accessibilita.isNotEmpty
                        ? luoghi[widget.indexLuogo]
                                    .accessibilita
                                    .first
                                    .accessibilita ==
                                1
                            ? Colors.green
                            : luoghi[widget.indexLuogo]
                                        .accessibilita
                                        .first
                                        .accessibilita ==
                                    2
                                ? Colors.orange
                                : luoghi[widget.indexLuogo]
                                            .accessibilita
                                            .first
                                            .accessibilita ==
                                        3
                                    ? Colors.red
                                    : Colors.grey
                        : Colors.grey,
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
                child: Text(
                  luoghi[widget.indexLuogo].indirizzo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
              rating: luoghi[widget.indexLuogo].mediaRecensioni,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(
                    child: TrasportiPage(
                      indexLuogo: widget.indexLuogo,
                    ),
                  ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(
                    child: ContattiPage(
                      indexLuogo: widget.indexLuogo,
                    ),
                  ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPage(
                    child: OrariPage(
                      indexLuogo: widget.indexLuogo,
                    ),
                  ),
                ),
              );
            },
          ),
          title: luoghi[widget.indexLuogo].orari.isNotEmpty
              ? Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          luoghi[widget.indexLuogo].orari.first.isOpen()
                              ? const Text("APERTO")
                              : const Text("CHIUSO"),
                          Text(getDayOfWeek()),
                        ],
                      ),
                    ),
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(luoghi[widget.indexLuogo]
                              .orari
                              .first
                              .getOrarioOggi()
                              .mattina
                              .toString()),
                          Text(luoghi[widget.indexLuogo]
                              .orari
                              .first
                              .getOrarioOggi()
                              .pomeriggio
                              .toString()),
                        ],
                      ),
                    )
                  ],
                )
              : const Center(
                  child: Text("Nessun orario disponibile"),
                ),
        ),
        RecensioneForm(
          indexLuogo: widget.indexLuogo,
          onRecensione: (valuta, pericolo) {
            setState(() {
              int x = 0;
              luoghi[widget.indexLuogo].recensioni.forEach((element) {
                x = x + element.star;
              });
              luoghi[widget.indexLuogo].mediaRecensioni =
                  x / luoghi[widget.indexLuogo].recensioni.length;
            });
          },
        ),
      ],
    );
  }
}

class RecensioneForm extends StatefulWidget {
  final int indexLuogo;
  final Function(int, int) onRecensione;
  const RecensioneForm({
    Key? key,
    required this.indexLuogo,
    required this.onRecensione,
  }) : super(key: key);

  @override
  State<RecensioneForm> createState() => _RecensioneFormState();
}

class _RecensioneFormState extends State<RecensioneForm> {
  late int pericolo = 1;

  late String recensione;

  late int valuta = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
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
                    ),
                  ),
                  title: Material(
                    elevation: 13,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      onChanged: ((value) {
                        recensione = value;
                      }),
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
                        suffixIcon: SelectPericoloLevel(
                          onColor: (color) {
                            if (color == Colors.green) {
                              pericolo = 1;
                            } else if (color == Colors.orange) {
                              pericolo = 2;
                            } else if (color == Colors.red) {
                              pericolo = 3;
                            } else {
                              pericolo = -1;
                            }
                          },
                        ),
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
                      onRatingUpdate: (double value) {
                        valuta = value.toInt();
                      },
                      unratedColor: const Color(0XFFC4C4C4),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      if (valuta != 0) {
                        setState(() {
                          luoghi[widget.indexLuogo].recensioni.add(
                                Recensione(
                                  utenteLoggato,
                                  0,
                                  recensione,
                                  [],
                                  pericolo,
                                  valuta,
                                ),
                              );
                          luoghi[widget.indexLuogo].recensioni.sort(
                                (a, b) => b.voto.compareTo(a.voto),
                              );
                        });
                        widget.onRecensione(valuta, pericolo);
                      }
                    },
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
        ),
        ...List.generate(
          luoghi[widget.indexLuogo].recensioni.length,
          (index) => RecensioneItem(
            key: Key("Recensione${widget.indexLuogo}$index"),
            indexLuogo: widget.indexLuogo,
            indexRecensione: index,
            onVote: () {
              setState(() {
                luoghi[widget.indexLuogo].recensioni.sort(
                      (a, b) => b.voto.compareTo(a.voto),
                    );
              });
            },
          ),
        )
      ],
    );
  }
}

class SelectPericoloLevel extends StatefulWidget {
  final Function onColor;
  const SelectPericoloLevel({Key? key, required this.onColor})
      : super(key: key);

  @override
  State<SelectPericoloLevel> createState() => _SelectPericoloLevelState();
}

class _SelectPericoloLevelState extends State<SelectPericoloLevel> {
  Color selectColor = Colors.green;

  void change(newColor) {
    setState(() {
      selectColor = newColor;
    });
    widget.onColor(selectColor);
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
          child: Center(
            child: Icon(
              Icons.report_problem,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
        const PopupMenuItem(
          value: Colors.orange,
          child: Center(
            child: Icon(
              Icons.report_problem,
              color: Colors.orange,
              size: 40,
            ),
          ),
        ),
        const PopupMenuItem(
          value: Colors.green,
          child: Center(
            child: Icon(
              Icons.report_problem,
              color: Colors.green,
              size: 40,
            ),
          ),
        )
      ],
    );
  }
}

class RecensioneItem extends StatefulWidget {
  final int indexLuogo;
  final int indexRecensione;
  final Function onVote;
  const RecensioneItem({
    Key? key,
    required this.indexLuogo,
    required this.indexRecensione,
    required this.onVote,
  }) : super(key: key);

  @override
  State<RecensioneItem> createState() => _RecensioneItemState();
}

class _RecensioneItemState extends State<RecensioneItem> {
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
                luoghi[widget.indexLuogo]
                    .recensioni[widget.indexRecensione]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_up,
                color: luoghi[widget.indexLuogo]
                            .recensioni[widget.indexRecensione]
                            .getVoto(utenteLoggato) ==
                        1
                    ? Colors.green
                    : Colors.black,
              ),
            ),
            Text(luoghi[widget.indexLuogo]
                .recensioni[widget.indexRecensione]
                .voto
                .toString()),
            IconButton(
              onPressed: () {
                luoghi[widget.indexLuogo]
                    .recensioni[widget.indexRecensione]
                    .downVoto(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: luoghi[widget.indexLuogo]
                            .recensioni[widget.indexRecensione]
                            .getVoto(utenteLoggato) ==
                        -1
                    ? Colors.red
                    : Colors.black,
              ),
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
                    children: [
                      Icon(
                        Icons.workspace_premium,
                        color: luoghi[widget.indexLuogo]
                                    .recensioni[widget.indexRecensione]
                                    .utente
                                    .rank ==
                                1
                            ? const Color(0XFFD27C2C)
                            : luoghi[widget.indexLuogo]
                                        .recensioni[widget.indexRecensione]
                                        .utente
                                        .rank ==
                                    2
                                ? const Color(0XFFC4C4C4)
                                : luoghi[widget.indexLuogo]
                                            .recensioni[widget.indexRecensione]
                                            .utente
                                            .rank ==
                                        3
                                    ? const Color(0XFFFFC700)
                                    : Colors.black,
                      ),
                      Text(
                        "${luoghi[widget.indexLuogo].recensioni[widget.indexRecensione].utente.nome} ${luoghi[widget.indexLuogo].recensioni[widget.indexRecensione].utente.cognome}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  RatingBarIndicator(
                    rating: luoghi[widget.indexLuogo]
                            .recensioni[widget.indexRecensione]
                            .star *
                        1.0,
                    itemSize: 15,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Color(0XFFF6E018),
                    ),
                    unratedColor: const Color(0XFFC4C4C4),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  luoghi[widget.indexLuogo]
                      .recensioni[widget.indexRecensione]
                      .informazioni,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.report_problem,
          color: luoghi[widget.indexLuogo]
                      .recensioni[widget.indexRecensione]
                      .pericolo ==
                  1
              ? Colors.green
              : luoghi[widget.indexLuogo]
                          .recensioni[widget.indexRecensione]
                          .pericolo ==
                      2
                  ? Colors.orange
                  : luoghi[widget.indexLuogo]
                              .recensioni[widget.indexRecensione]
                              .pericolo ==
                          3
                      ? Colors.red
                      : Colors.grey,
          size: 50,
        )
      ],
    );
  }
}
