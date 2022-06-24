import 'package:flutter/material.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/utente.dart';

class VisualizzaOrario extends StatelessWidget {
  final int indexLuogo;
  final int indexOrario;
  const VisualizzaOrario({
    Key? key,
    required this.indexLuogo,
    required this.indexOrario,
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
                "Visualizza orari",
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
                Icons.add_location_alt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: VisualizzaOrariBody(
        indexLuogo: indexLuogo,
        indexOrario: indexOrario,
      ),
    );
  }
}

class VisualizzaOrariBody extends StatefulWidget {
  final int indexLuogo;
  final int indexOrario;
  const VisualizzaOrariBody({
    Key? key,
    required this.indexLuogo,
    required this.indexOrario,
  }) : super(key: key);

  @override
  State<VisualizzaOrariBody> createState() => _VisualizzaOrariBodyState();
}

class _VisualizzaOrariBodyState extends State<VisualizzaOrariBody> {
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
                        'Mattina',
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Pomeriggio',
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Lunedì',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .lunedi
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .lunedi
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .lunedi
                            .pomeriggio
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .lunedi
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Martedì',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Mercoledì',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .mercoledi
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .martedi
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Giovedì',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .giovedi
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .giovedi
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .giovedi
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .giovedi
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Venerdì',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .venerdi
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .venerdi
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .venerdi
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .venerdi
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Sabato',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .sabato
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .sabato
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .sabato
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .sabato
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
              ),
              TableRow(
                children: [
                  Column(
                    children: const [
                      Text(
                        'Domenica',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .domenica
                            .mattina
                            .inizio,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .domenica
                            .mattina
                            .fine,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .domenica
                            .pomeriggio
                            .fine,
                      ),
                      TimeView(
                        orario: luoghi[widget.indexLuogo]
                            .orari[widget.indexOrario]
                            .domenica
                            .pomeriggio
                            .fine,
                      ),
                    ],
                  ),
                ],
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
                    .orari[widget.indexOrario]
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
                        .orari[widget.indexOrario]
                        .upVote(utenteLoggato);
                  });
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
              Text(luoghi[widget.indexLuogo]
                  .orari[widget.indexOrario]
                  .voto
                  .toString()),
              IconButton(
                onPressed: () {
                  setState(() {
                    luoghi[widget.indexLuogo]
                        .orari[widget.indexOrario]
                        .downVoto(utenteLoggato);
                  });
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Center(
        child: Text(
          orario,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
