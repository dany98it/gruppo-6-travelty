import 'package:flutter/material.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/utente.dart';

class TrasportiOrario extends StatelessWidget {
  final int indexLuogo;
  final int indexTrasporto;
  final int indexFermata;
  const TrasportiOrario({
    Key? key,
    required this.indexLuogo,
    required this.indexTrasporto,
    required this.indexFermata,
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
              Text(
                "Fermata ${indexFermata + 1}",
                style: const TextStyle(
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
                Icons.add_location_alt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: TrasportiOrariBody(
          indexLuogo: indexLuogo,
          indexTrasporto: indexTrasporto,
          indexFermata: indexFermata),
    );
  }
}

class TrasportiOrariBody extends StatefulWidget {
  final int indexLuogo;
  final int indexTrasporto;
  final int indexFermata;
  const TrasportiOrariBody({
    Key? key,
    required this.indexLuogo,
    required this.indexTrasporto,
    required this.indexFermata,
  }) : super(key: key);

  @override
  State<TrasportiOrariBody> createState() => _TrasportiOrariBodyState();
}

class _TrasportiOrariBodyState extends State<TrasportiOrariBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Table(
            defaultColumnWidth: const FixedColumnWidth(120.0),
            children: [
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        '',
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Arrivo',
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Partenza',
                      ),
                    ],
                  ),
                ],
              ),
              ...List.generate(
                luoghi[widget.indexLuogo]
                    .trasporti[widget.indexTrasporto]
                    .fermate[widget.indexFermata]
                    .orari
                    .length,
                (index) => TableRow(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Orario ${index + 1}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimeView(
                          orario: luoghi[widget.indexLuogo]
                              .trasporti[widget.indexTrasporto]
                              .fermate[widget.indexFermata]
                              .orari[index]
                              .inizio,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimeView(
                          orario: luoghi[widget.indexLuogo]
                              .trasporti[widget.indexTrasporto]
                              .fermate[widget.indexFermata]
                              .orari[index]
                              .fine,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Text(
            "Informazioni aggiuntive",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Text(
                luoghi[widget.indexLuogo]
                    .trasporti[widget.indexTrasporto]
                    .informazioni,
              ),
            ),
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    luoghi[widget.indexLuogo]
                        .trasporti[widget.indexTrasporto]
                        .upVote(utenteLoggato);
                  });
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
              Text(luoghi[widget.indexLuogo]
                  .trasporti[widget.indexTrasporto]
                  .voto
                  .toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    luoghi[widget.indexLuogo]
                        .trasporti[widget.indexTrasporto]
                        .downVoto(utenteLoggato);
                  });
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
        ],
      ),
    );
  }
}

class TimeView extends StatelessWidget {
  final String orario;
  const TimeView({Key? key, required this.orario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Text(
          orario,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
