import 'package:travelty/info.dart';

class Recensione extends Info {
  int pericolo;
  int star;
  Recensione(
      super.utente, super.voto, super.informazioni, this.pericolo, this.star);
}
