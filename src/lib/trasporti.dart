import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_trasporto.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/trasporti_map.dart';
import 'package:travelty/utente.dart';

class TrasportiPage extends StatelessWidget {
  final int indexLuogo;
  const TrasportiPage({
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
                "Trasporti",
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
                Icons.directions_bus_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn6",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPage(
                child: AggiungiTrasporti(
                  indexLuogo: indexLuogo,
                ),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.bus_alert),
      ),
      body: Trasporti(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class Trasporti extends StatefulWidget {
  final int indexLuogo;
  const Trasporti({Key? key, required this.indexLuogo}) : super(key: key);

  @override
  State<Trasporti> createState() => _TrasportiState();
}

class _TrasportiState extends State<Trasporti> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          luoghi[widget.indexLuogo].trasporti.length,
          (index) => TrasportiItem(
            key: Key("Trasporto${widget.indexLuogo}$index"),
            indexLuogo: widget.indexLuogo,
            indexTrasporto: index,
            onVote: () {
              setState(() {
                luoghi[widget.indexLuogo].trasporti.sort(
                      (a, b) => b.voto.compareTo(a.voto),
                    );
              });
            },
          ),
        ),
      ],
    );
  }
}

class TrasportiItem extends StatefulWidget {
  final int indexLuogo;
  final int indexTrasporto;
  final Function onVote;
  const TrasportiItem(
      {Key? key,
      required this.indexLuogo,
      required this.indexTrasporto,
      required this.onVote})
      : super(key: key);

  @override
  State<TrasportiItem> createState() => _TrasportiItemState();
}

class _TrasportiItemState extends State<TrasportiItem> {
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
                    .trasporti[widget.indexTrasporto]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_up,
                color: luoghi[widget.indexLuogo]
                            .trasporti[widget.indexTrasporto]
                            .getVoto(utenteLoggato) ==
                        1
                    ? Colors.green
                    : Colors.black,
              ),
            ),
            Text(
                "${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].voto}"),
            IconButton(
              onPressed: () {
                luoghi[widget.indexLuogo]
                    .trasporti[widget.indexTrasporto]
                    .downVoto(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: luoghi[widget.indexLuogo]
                            .trasporti[widget.indexTrasporto]
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
                                    .trasporti[widget.indexTrasporto]
                                    .utente
                                    .rank ==
                                1
                            ? const Color(0XFFD27C2C)
                            : luoghi[widget.indexLuogo]
                                        .trasporti[widget.indexTrasporto]
                                        .utente
                                        .rank ==
                                    2
                                ? const Color(0XFFC4C4C4)
                                : luoghi[widget.indexLuogo]
                                            .trasporti[widget.indexTrasporto]
                                            .utente
                                            .rank ==
                                        3
                                    ? const Color(0XFFFFC700)
                                    : Colors.black,
                      ),
                      Text(
                        "${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].utente.nome} ${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].utente.cognome}",
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
                  "${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].tipo} \n${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].azienda}:${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].linea} \n${luoghi[widget.indexLuogo].trasporti[widget.indexTrasporto].informazioni}",
                ),
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
                  child: MappaTrasporti(
                    indexLuogo: widget.indexLuogo,
                    indexTrasporto: widget.indexTrasporto,
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
