import 'package:travelty/contatto.dart';
import 'package:travelty/recensioni_accessibilita.dart';
import 'package:travelty/recenzione.dart';
import 'package:travelty/trasporto.dart';
import 'package:travelty/orario.dart';

class Luogo {
  double x;
  double y;
  String nome;
  String indirizzo;
  int mediaRecensioni;
  int mediaPericolo;
  List<Recensione> recensioni;
  List<Contatto> contatti;
  List<Orario> orari;
  List<Trasporto> trasporti;
  int mediaAccessibilita;
  List<RecensioneAccessibilita> accessibilita;

  Luogo(
    this.x,
    this.y,
    this.nome,
    this.indirizzo,
    this.mediaRecensioni,
    this.mediaPericolo,
    this.recensioni,
    this.contatti,
    this.orari,
    this.trasporti,
    this.mediaAccessibilita,
    this.accessibilita,
  );
}
