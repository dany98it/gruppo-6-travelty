import 'package:travelty/utente.dart';
import 'package:travelty/voto.dart';

abstract class Info {
  Utente utente;
  int voto;
  String informazioni;
  List<Voto> votanti;

  Info(
    this.utente,
    this.voto,
    this.informazioni,
    this.votanti,
  );

  upVote(Utente u) {
    for (var user in votanti) {
      if (user.utente == u) {
        if (user.voto == -1) {
          voto = voto + 2;
          votanti.add(Voto(u, -1));
          return;
        } else if (user.voto == 1) {
          voto = voto - 1;
          votanti.add(Voto(u, 0));
          return;
        }
      }
    }
    votanti.add(Voto(u, 1));
    voto = voto + 1;
  }

  downVoto(Utente u) {
    for (var user in votanti) {
      if (user.utente == u) {
        if (user.voto == 1) {
          voto = voto - 2;
          votanti.add(Voto(u, 1));
          return;
        } else if (user.voto == -1) {
          voto = voto + 1;
          votanti.add(Voto(u, 0));
          return;
        }
      }
    }
    votanti.add(Voto(u, -1));
    voto = voto - 1;
  }
}
