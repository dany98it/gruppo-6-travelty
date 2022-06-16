import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  const Setting({Key? key, required this.nextPage, required this.previewPage})
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
          "Impostazioni",
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
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFF4C8F38),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0XFF4C8F38),
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
                ],
              ),
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
                  for (int i = 0; i < 20; i++)
                    SettingItem(
                      key: Key("Setting$i"),
                    ),
                ],
              ),
            )),
      ],
    );
  }
}

class SettingItem extends StatefulWidget {
  const SettingItem({Key? key}) : super(key: key);

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool b = false;

  void change() {
    setState(() {
      b = !b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: const [
          Text(
            "Privacy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text("Invia feedback agli sviluppatori")
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
