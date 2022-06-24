import 'package:flutter/material.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/recensioni_accessibilita.dart';
import 'package:travelty/utente.dart';

class AccessibilitaPage extends StatelessWidget {
  final int indexLuogo;
  const AccessibilitaPage({
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                luoghi[indexLuogo].nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Text(
                "Accessibilità",
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
                Icons.accessible_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Accessibilita(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class Accessibilita extends StatefulWidget {
  final int indexLuogo;
  const Accessibilita({Key? key, required this.indexLuogo}) : super(key: key);

  @override
  State<Accessibilita> createState() => _AccessibilitaState();
}

class _AccessibilitaState extends State<Accessibilita> {
  late int accessibilita = 1;
  late String recensione;
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    child: Icon(Icons.person),
                  ),
                  title: Material(
                    elevation: 13,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    child: TextFormField(
                      onChanged: (value) {
                        recensione = value;
                      },
                      onFieldSubmitted: (value) {
                        setState(() {
                          if (luoghi[widget.indexLuogo].mediaPericolo == 0) {
                            luoghi[widget.indexLuogo].mediaAccessibilita =
                                accessibilita;
                          } else {
                            luoghi[widget.indexLuogo].mediaPericolo =
                                (luoghi[widget.indexLuogo].mediaAccessibilita +
                                        accessibilita / 2)
                                    .toInt();
                          }
                          luoghi[widget.indexLuogo].accessibilita.add(
                                RecensioneAccessibilita(
                                  utenteLoggato,
                                  0,
                                  recensione,
                                  [],
                                  accessibilita,
                                ),
                              );
                          luoghi[widget.indexLuogo].accessibilita.sort(
                                (a, b) => b.voto.compareTo(a.voto),
                              );
                        });
                      },
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
                        suffixIcon: SelectAccessibilitaLevel(
                          onColor: (color) {
                            if (color == Colors.green) {
                              accessibilita = 1;
                            } else if (color == Colors.orange) {
                              accessibilita = 2;
                            } else if (color == Colors.red) {
                              accessibilita = 3;
                            } else {
                              accessibilita = -1;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ...List.generate(
          luoghi[widget.indexLuogo].accessibilita.length,
          (index) => AccessibilitaItem(
            key: Key("Accessibilita${widget.indexLuogo}$index"),
            indexLuogo: widget.indexLuogo,
            indexAccessibilita: index,
            onVote: () {
              setState(() {
                luoghi[widget.indexLuogo].accessibilita.sort(
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

class SelectAccessibilitaLevel extends StatefulWidget {
  final Function onColor;
  const SelectAccessibilitaLevel({Key? key, required this.onColor})
      : super(key: key);

  @override
  State<SelectAccessibilitaLevel> createState() =>
      _SelectAccessibilitaLevelState();
}

class _SelectAccessibilitaLevelState extends State<SelectAccessibilitaLevel> {
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
        Icons.accessible_outlined,
        color: selectColor,
        size: 40,
      ),
      padding: const EdgeInsets.only(right: 5),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: Colors.red,
          child: Center(
            child: Icon(
              Icons.accessible_outlined,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
        const PopupMenuItem(
          value: Colors.orange,
          child: Center(
            child: Icon(
              Icons.accessible_outlined,
              color: Colors.orange,
              size: 40,
            ),
          ),
        ),
        const PopupMenuItem(
          value: Colors.green,
          child: Center(
            child: Icon(
              Icons.accessible_outlined,
              color: Colors.green,
              size: 40,
            ),
          ),
        )
      ],
    );
  }
}

class AccessibilitaItem extends StatefulWidget {
  final int indexLuogo;
  final int indexAccessibilita;
  final Function onVote;
  const AccessibilitaItem({
    Key? key,
    required this.indexLuogo,
    required this.indexAccessibilita,
    required this.onVote,
  }) : super(key: key);

  @override
  State<AccessibilitaItem> createState() => _AccessibilitaItemState();
}

class _AccessibilitaItemState extends State<AccessibilitaItem> {
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
                    .accessibilita[widget.indexAccessibilita]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_up,
                color: luoghi[widget.indexLuogo]
                            .accessibilita[widget.indexAccessibilita]
                            .getVoto(utenteLoggato) ==
                        1
                    ? Colors.green
                    : Colors.black,
              ),
            ),
            Text(luoghi[widget.indexLuogo]
                .accessibilita[widget.indexAccessibilita]
                .voto
                .toString()),
            IconButton(
              onPressed: () {
                luoghi[widget.indexLuogo]
                    .accessibilita[widget.indexAccessibilita]
                    .downVoto(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: luoghi[widget.indexLuogo]
                            .accessibilita[widget.indexAccessibilita]
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
                                    .accessibilita[widget.indexAccessibilita]
                                    .utente
                                    .rank ==
                                1
                            ? const Color(0XFFD27C2C)
                            : luoghi[widget.indexLuogo]
                                        .accessibilita[
                                            widget.indexAccessibilita]
                                        .utente
                                        .rank ==
                                    2
                                ? const Color(0XFFC4C4C4)
                                : luoghi[widget.indexLuogo]
                                            .accessibilita[
                                                widget.indexAccessibilita]
                                            .utente
                                            .rank ==
                                        3
                                    ? const Color(0XFFFFC700)
                                    : Colors.black,
                      ),
                      Text(
                        "${luoghi[widget.indexLuogo].accessibilita[widget.indexAccessibilita].utente.nome} ${luoghi[widget.indexLuogo].accessibilita[widget.indexAccessibilita].utente.cognome}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                luoghi[widget.indexLuogo]
                    .accessibilita[widget.indexAccessibilita]
                    .informazioni,
              ),
            ],
          ),
        ),
        Icon(
          Icons.accessible_outlined,
          color: luoghi[widget.indexLuogo]
                      .accessibilita[widget.indexAccessibilita]
                      .accessibilita ==
                  1
              ? Colors.green
              : luoghi[widget.indexLuogo]
                          .accessibilita[widget.indexAccessibilita]
                          .accessibilita ==
                      2
                  ? Colors.orange
                  : luoghi[widget.indexLuogo]
                              .accessibilita[widget.indexAccessibilita]
                              .accessibilita ==
                          3
                      ? Colors.red
                      : Colors.grey,
          size: 50,
        )
      ],
    );
  }
}
