import 'package:travelty/info.dart';

class Recensioni extends Info {
  int pericolo;
  int star;
  Recensioni(
      super.utente, super.voto, super.informazioni, this.pericolo, this.star);
}
