import 'package:travelty/info.dart';

class RecensioneAccessibilita extends Info {
  int accessibilita;

  RecensioneAccessibilita(
    super.utente,
    super.voto,
    super.informazioni,
    super.votanti,
    this.accessibilita,
  );
}
