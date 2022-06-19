import 'package:travelty/utente.dart';

abstract class Info {
  Utente utente;
  int voto;
  String informazioni;

  Info(this.utente, this.voto, this.informazioni);

  upVote() {
    voto = voto + 1;
  }

  setVoto(voto) {
    this.voto = voto;
  }

  downVoto() {
    voto = voto - 1;
  }
}
