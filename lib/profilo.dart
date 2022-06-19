import 'package:flutter/material.dart';

class Profilo extends StatelessWidget {
  final Function nextPage;
  final Function previewPage;
  const Profilo({Key? key, required this.nextPage, required this.previewPage})
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
          "Profilo",
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
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 10)),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                backgroundColor: Color(0XFFB9B9B9),
                radius: 100,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 180,
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0XFF5BA942),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Text(
            "Username",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.medical_information,
              ),
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Reputazione",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Novizio"),
                ],
              ),
            ],
          ),
          const Expanded(
            child: AccountList(),
          ),
        ],
      ),
    );
  }
}

class AccountList extends StatelessWidget {
  const AccountList({Key? key}) : super(key: key);

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
                    AccountItem(
                      key: Key("Account$i"),
                    ),
                ],
              ),
            )),
      ],
    );
  }
}

class AccountItem extends StatefulWidget {
  const AccountItem({Key? key}) : super(key: key);

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
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
            "Nome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text("Mario")
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {},
      ),
      leading: const CircleAvatar(
        backgroundColor: Color(0XFFB9B9B9),
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}
