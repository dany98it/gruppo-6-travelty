import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_orario.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/utente.dart';
import 'package:travelty/visualizza_orario.dart';

class OrariPage extends StatelessWidget {
  final int indexLuogo;
  const OrariPage({
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
                "Orari",
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
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn4",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPage(
                child: AggiungiOrario(
                  indexLuogo: indexLuogo,
                ),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.event_available),
      ),
      body: Orari(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class Orari extends StatefulWidget {
  final int indexLuogo;
  const Orari({
    Key? key,
    required this.indexLuogo,
  }) : super(key: key);

  @override
  State<Orari> createState() => _OrariState();
}

class _OrariState extends State<Orari> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          luoghi[widget.indexLuogo].orari.length,
          (index) => OrariItem(
            key: Key(
              "Orari${widget.indexLuogo}$index",
            ),
            indexLuogo: widget.indexLuogo,
            indexOrario: index,
            onVote: () {
              setState(() {
                luoghi[widget.indexLuogo].orari.sort(
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

class OrariItem extends StatefulWidget {
  final int indexLuogo;
  final int indexOrario;
  final Function onVote;
  const OrariItem({
    Key? key,
    required this.indexLuogo,
    required this.indexOrario,
    required this.onVote,
  }) : super(key: key);

  @override
  State<OrariItem> createState() => _OrariItemState();
}

class _OrariItemState extends State<OrariItem> {
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
                    .orari[widget.indexOrario]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_up,
                color: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .getVoto(utenteLoggato) ==
                        1
                    ? Colors.green
                    : Colors.black,
              ),
            ),
            Text("${luoghi[widget.indexLuogo].orari[widget.indexOrario].voto}"),
            IconButton(
              onPressed: () {
                luoghi[widget.indexLuogo]
                    .orari[widget.indexOrario]
                    .downVoto(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
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
                                    .orari[widget.indexOrario]
                                    .utente
                                    .rank ==
                                1
                            ? const Color(0XFFD27C2C)
                            : luoghi[widget.indexLuogo]
                                        .orari[widget.indexOrario]
                                        .utente
                                        .rank ==
                                    2
                                ? const Color(0XFFC4C4C4)
                                : luoghi[widget.indexLuogo]
                                            .orari[widget.indexOrario]
                                            .utente
                                            .rank ==
                                        3
                                    ? const Color(0XFFFFC700)
                                    : Colors.black,
                      ),
                      Text(
                        "${luoghi[widget.indexLuogo].orari[widget.indexOrario].utente.nome} ${luoghi[widget.indexLuogo].orari[widget.indexOrario].utente.cognome}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                    "${luoghi[widget.indexLuogo].orari[widget.indexOrario].getOrarioOggi()} ${luoghi[widget.indexLuogo].orari[widget.indexOrario].informazioni}"),
              ),
            ],
          ),
        ),
        IconButton(
          iconSize: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPage(
                  child: VisualizzaOrario(
                    indexLuogo: widget.indexLuogo,
                    indexOrario: widget.indexOrario,
                  ),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
