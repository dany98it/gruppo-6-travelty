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
      body: const SettingList(),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < 10; i++) const SettingItem(),
      ],
    );
  }
}

//TODO: diventare Stateful cosi da rimanere attivo aggiungere un costruttore che accetta il valore
class SettingItem extends StatelessWidget {
  const SettingItem({Key? key}) : super(key: key);

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
        value: false,
        onChanged: (val) {},
      ),
    );
  }
}
