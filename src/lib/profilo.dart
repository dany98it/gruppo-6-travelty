import 'package:flutter/material.dart';
import 'package:travelty/utente.dart';

class Profilo extends StatelessWidget {
  const Profilo({
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
            "Profilo",
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
          Text(
            "${utenteLoggato.nome} ${utenteLoggato.cognome}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.workspace_premium,
                color: utenteLoggato.rank == 1
                    ? const Color(0XFFD27C2C)
                    : utenteLoggato.rank == 2
                        ? const Color(0XFFC4C4C4)
                        : utenteLoggato.rank == 3
                            ? const Color(0XFFFFC700)
                            : Colors.black,
              ),
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reputazione: ${utenteLoggato.rank}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text("Esperienza: ${utenteLoggato.esperienza}"),
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
                  AccountItem(
                    title: "Nome",
                    subtitle: utenteLoggato.nome,
                  ),
                  AccountItem(
                    title: "Cognome",
                    subtitle: utenteLoggato.cognome,
                  ),
                  AccountItem(
                    title: "Data di nascita",
                    subtitle: utenteLoggato.dataNascita,
                  ),
                  AccountItem(
                    title: "Email",
                    subtitle: utenteLoggato.email,
                  ),
                  AccountItem(
                    title: "Nome",
                    subtitle: utenteLoggato.nome,
                  ),
                  const AccountItem(
                    title: "Password",
                    subtitle: "***************************",
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class AccountItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const AccountItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(subtitle)
        ],
      ),
    );
  }
}
