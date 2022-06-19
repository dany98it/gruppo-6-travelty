import 'package:travelty/info.dart';
import 'package:travelty/orario.dart';

class Trasporto extends Info {
  List<Fermata> fermate;
  String tipo;
  String azienda;
  String linea;
  Trasporto(super.utente, super.voto, super.informazioni, super.votanti,
      this.fermate, this.tipo, this.azienda, this.linea);
}

class Fermata {
  double x;
  double y;
  List<Range> orari;

  Fermata(this.x, this.y, orari);
}
