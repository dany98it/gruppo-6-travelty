import 'package:flutter/material.dart';

class AccessibilitaPage extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  final String nomeLuogo;
  const AccessibilitaPage(
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
      body: const Accessibilita(),
    );
  }
}

class Accessibilita extends StatefulWidget {
  const Accessibilita({Key? key}) : super(key: key);

  @override
  State<Accessibilita> createState() => _AccessibilitaState();
}

class _AccessibilitaState extends State<Accessibilita> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AccessibilitaForm(),
        for (int i = 0; i < 20; i++)
          AccessibilitaItem(
            key: Key("Account$i"),
          ),
      ],
    );
  }
}

class AccessibilitaForm extends StatelessWidget {
  const AccessibilitaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  color: Colors.white,
                ),
              ),
              title: Material(
                elevation: 13,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
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
                    suffixIcon: SelectAccessibilitaLevel(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectAccessibilitaLevel extends StatefulWidget {
  const SelectAccessibilitaLevel({Key? key}) : super(key: key);

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
          child: Icon(
            Icons.accessible_outlined,
            color: Colors.red,
            size: 40,
          ),
        ),
        const PopupMenuItem(
          value: Colors.orange,
          child: Icon(
            Icons.accessible_outlined,
            color: Colors.orange,
            size: 40,
          ),
        ),
        const PopupMenuItem(
          value: Colors.green,
          child: Icon(
            Icons.accessible_outlined,
            color: Colors.green,
            size: 40,
          ),
        )
      ],
    );
  }
}

class AccessibilitaItem extends StatefulWidget {
  const AccessibilitaItem({Key? key}) : super(key: key);

  @override
  State<AccessibilitaItem> createState() => _AccessibilitaItemState();
}

class _AccessibilitaItemState extends State<AccessibilitaItem> {
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
          Icons.accessible_outlined,
          color: Colors.orange,
          size: 50,
        )
      ],
    );
  }
}
