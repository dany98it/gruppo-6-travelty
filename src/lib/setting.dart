import 'package:flutter/material.dart';

List<bool> _impostazioni = [false, false, false, false];

class Setting extends StatelessWidget {
  const Setting({
    Key? key,
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
        title: const Center(
          child: Text(
            "Impostazioni",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Color(0XFF4C8F38),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: SettingList(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 50, left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFF4C8F38),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Elimina account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFF4C8F38),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SettingItem(
                    key: Key("Setting0"),
                    index: 0,
                    title: "Privacy",
                    subtitle: "Invia feedback agli sviluppatori",
                  ),
                  const SettingItem(
                    key: Key("Setting1"),
                    index: 1,
                    title: "Tema(WIP)",
                    subtitle: "Tema chiaro/scruro",
                  ),
                  const SettingItem(
                    key: Key("Setting2"),
                    index: 2,
                    title: "Dati(WIP)",
                    subtitle: "Consenti utilizzo dati cellulare",
                  ),
                  const SettingItem(
                    key: Key("Setting3"),
                    index: 3,
                    title: "Mappa Offline(WIP)",
                    subtitle: "Visualizza mappa offline",
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class SettingItem extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  const SettingItem(
      {Key? key,
      required this.index,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool b = false;

  @override
  void initState() {
    b = _impostazioni[widget.index];
    super.initState();
  }

  void change() {
    setState(() {
      b = !b;
      _impostazioni[widget.index] = !_impostazioni[widget.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(widget.subtitle)
        ],
      ),
      trailing: Switch(
        value: b,
        onChanged: (val) {
          change();
        },
      ),
    );
  }
}
