import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_contatti.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/utente.dart';

class ContattiPage extends StatelessWidget {
  final int indexLuogo;
  const ContattiPage({Key? key, required this.indexLuogo}) : super(key: key);

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
                "contatti",
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
                Icons.phone,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPage(
                child: AggiungiContatti(
                  indexLuogo: indexLuogo,
                ),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.add_call),
      ),
      body: Contatti(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class Contatti extends StatefulWidget {
  final int indexLuogo;
  const Contatti({Key? key, required this.indexLuogo}) : super(key: key);

  @override
  State<Contatti> createState() => _ContattiState();
}

class _ContattiState extends State<Contatti> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          luoghi[widget.indexLuogo].contatti.length,
          (index) => ContattiItem(
            key: Key("Contatti${widget.indexLuogo}$index"),
            indexLuogo: widget.indexLuogo,
            indexContatti: index,
            onVote: () {
              setState(() {
                luoghi[widget.indexLuogo].contatti.sort(
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

class ContattiItem extends StatefulWidget {
  final int indexLuogo;
  final int indexContatti;
  final Function onVote;
  const ContattiItem(
      {Key? key,
      required this.indexLuogo,
      required this.indexContatti,
      required this.onVote})
      : super(key: key);

  @override
  State<ContattiItem> createState() => _ContattiItemState();
}

class _ContattiItemState extends State<ContattiItem> {
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
                    .contatti[widget.indexContatti]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_up,
                color: luoghi[widget.indexLuogo]
                            .contatti[widget.indexContatti]
                            .getVoto(utenteLoggato) ==
                        1
                    ? Colors.green
                    : Colors.black,
              ),
            ),
            Text(
              luoghi[widget.indexLuogo]
                  .contatti[widget.indexContatti]
                  .voto
                  .toString(),
            ),
            IconButton(
              onPressed: () {
                luoghi[widget.indexLuogo]
                    .contatti[widget.indexContatti]
                    .upVote(utenteLoggato);
                widget.onVote();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                color: luoghi[widget.indexLuogo]
                            .contatti[widget.indexContatti]
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
                                    .contatti[widget.indexContatti]
                                    .utente
                                    .rank ==
                                1
                            ? const Color(0XFFD27C2C)
                            : luoghi[widget.indexLuogo]
                                        .contatti[widget.indexContatti]
                                        .utente
                                        .rank ==
                                    2
                                ? const Color(0XFFC4C4C4)
                                : luoghi[widget.indexLuogo]
                                            .contatti[widget.indexContatti]
                                            .utente
                                            .rank ==
                                        3
                                    ? const Color(0XFFFFC700)
                                    : Colors.black,
                      ),
                      Text(
                        "${luoghi[widget.indexLuogo].contatti[widget.indexContatti].utente.nome} ${luoghi[widget.indexLuogo].contatti[widget.indexContatti].utente.cognome}",
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
                  "${luoghi[widget.indexLuogo].contatti[widget.indexContatti].tipo}: ${luoghi[widget.indexLuogo].contatti[widget.indexContatti].contatto}. \n${luoghi[widget.indexLuogo].contatti[widget.indexContatti].informazioni}",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
