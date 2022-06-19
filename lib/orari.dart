import 'package:flutter/material.dart';
import 'package:travelty/aggiungi_orario.dart';

class OrariPage extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  const OrariPage(
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
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeLuogo,
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
        onPressed: () {
          nextPage(
            AggiungiOrario(
              nextPage: nextPage,
              previewPage: previewPage,
              nomeLuogo: nomeLuogo,
            ),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(0XFF4C8F38),
        child: const Icon(Icons.event_available),
      ),
      body: const Orari(),
    );
  }
}

class Orari extends StatefulWidget {
  const Orari({Key? key}) : super(key: key);

  @override
  State<Orari> createState() => _OrariState();
}

class _OrariState extends State<Orari> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 20; i++)
          OrariItem(
            key: Key("Account$i"),
          ),
      ],
    );
  }
}

class OrariItem extends StatefulWidget {
  const OrariItem({Key? key}) : super(key: key);

  @override
  State<OrariItem> createState() => _OrariItemState();
}

class _OrariItemState extends State<OrariItem> {
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
                ],
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              ),
            ],
          ),
        ),
        const Icon(
          Icons.info_outline,
          color: Colors.black,
          size: 50,
        )
      ],
    );
  }
}
