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
    for (Voto v in votanti) {
      if (v.utente == u) {
        if (v.voto == -1) {
          voto = voto + 2;
          v.voto = 1;
          return;
        } else if (v.voto == 1) {
          voto = voto - 1;
          v.voto = 0;
          return;
        } else {
          voto = voto + 1;
          v.voto = 1;
          return;
        }
      }
    }
    votanti.add(Voto(u, 1));
    voto = voto + 1;
  }

  downVoto(Utente u) {
    for (Voto v in votanti) {
      if (v.utente == u) {
        if (v.voto == 1) {
          voto = voto - 2;
          v.voto = -1;
          return;
        } else if (v.voto == -1) {
          voto = voto + 1;
          v.voto = 0;
          return;
        } else {
          voto = voto - 1;
          v.voto = -1;
          return;
        }
      }
    }
    votanti.add(Voto(u, -1));
    voto = voto - 1;
  }

  int getVoto(Utente u) {
    for (Voto v in votanti) {
      if (v.utente == u) {
        return v.voto;
      }
    }
    return 0;
  }
}
