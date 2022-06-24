import 'package:flutter/material.dart';
import 'package:travelty/luogo.dart';
import 'package:travelty/main.dart';
import 'package:travelty/orario.dart';
import 'package:travelty/utente.dart';
import 'package:travelty/visualizza_orario.dart';

class AggiungiOrario extends StatelessWidget {
  final int indexLuogo;
  const AggiungiOrario({
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
                "Aggiungi orario",
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
      body: AggiungiOrarioForm(
        indexLuogo: indexLuogo,
      ),
    );
  }
}

class AggiungiOrarioForm extends StatefulWidget {
  final int indexLuogo;
  const AggiungiOrarioForm({
    Key? key,
    required this.indexLuogo,
  }) : super(key: key);

  @override
  State<AggiungiOrarioForm> createState() => _AggiungiOrarioFormState();
}

class _AggiungiOrarioFormState extends State<AggiungiOrarioForm> {
  Orario o = Orario(
    utenteLoggato,
    0,
    "",
    [],
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
    RangeGiornaliero(
      Range("00 : 00", "00 : 00"),
      Range("00 : 00", "00 : 00"),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          const Text(
            "Inserisci orario di apertura",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                      TimePicker(onTimePick: (String time) {
                        o.lunedi.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.lunedi.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.lunedi.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.lunedi.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.martedi.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.martedi.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.martedi.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.martedi.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.mercoledi.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.mercoledi.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.mercoledi.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.mercoledi.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.giovedi.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.giovedi.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.giovedi.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.giovedi.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.venerdi.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.venerdi.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.venerdi.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.venerdi.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.sabato.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.sabato.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.sabato.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.sabato.pomeriggio.fine = time;
                      }),
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
                      TimePicker(onTimePick: (String time) {
                        o.domenica.mattina.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.domenica.mattina.fine = time;
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimePicker(onTimePick: (String time) {
                        o.domenica.pomeriggio.inizio = time;
                      }),
                      TimePicker(onTimePick: (String time) {
                        o.domenica.pomeriggio.fine = time;
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 13,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                onChanged: (value) {
                  o.informazioni = value;
                },
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
                  labelText: "Ulteriori informazioni",
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFF4C8F38),
                ),
                onPressed: () {
                  luoghi[widget.indexLuogo].orari.add(o);
                  luoghi[widget.indexLuogo].orari.sort(
                        (a, b) => b.voto.compareTo(a.voto),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPage(
                        child: VisualizzaOrario(
                          indexLuogo: widget.indexLuogo,
                          indexOrario:
                              luoghi[widget.indexLuogo].orari.length - 1,
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Conferma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  final Function onTimePick;
  const TimePicker({Key? key, required this.onTimePick}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late String finishAssignmentTime = "00 : 00";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 0, minute: 0))
            .then(
          (time) {
            setState(
              () {
                finishAssignmentTime =
                    "${time!.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}";
              },
            );
            widget.onTimePick(finishAssignmentTime);
          },
        );
      },
      child: Container(
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
            finishAssignmentTime,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
