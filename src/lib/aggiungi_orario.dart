import 'package:flutter/material.dart';

class AggiungiOrario extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  const AggiungiOrario(
      {Key? key,
      required this.nextPage,
      required this.previewPage,
      required this.nomeLuogo})
      : super(key: key);
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
        title: const Text(
          "Aggiungi Orario",
          style: TextStyle(
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
                Icons.add_location_alt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const AggiungiOrarioForm(),
    );
  }
}

class AggiungiOrarioForm extends StatefulWidget {
  const AggiungiOrarioForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AggiungiOrarioForm> createState() => _AggiungiOrarioFormState();
}

class _AggiungiOrarioFormState extends State<AggiungiOrarioForm> {
  late String finishAssignmentTime = "00:00";

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
            defaultColumnWidth: FixedColumnWidth(120.0),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
                    children: const [
                      TimePicker(),
                      TimePicker(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TimePicker(),
                      TimePicker(),
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
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0XFF4C8F38),
              ),
              onPressed: () {},
              child: const Text(
                "Conferma",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late String finishAssignmentTime = "00:00";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
          (time) {
            setState(
              () {
                finishAssignmentTime =
                    "${time!.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}";
              },
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
        child: Center(
          child: Text(
            finishAssignmentTime,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
