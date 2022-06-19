import 'package:travelty/info.dart';

class Contatto extends Info {
  String tipo;
  String contatto;

  Contatto(
    super.utente,
    super.voto,
    super.informazioni,
    super.votanti,
    this.tipo,
    this.contatto,
  );
}
