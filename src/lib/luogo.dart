import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelty/contatto.dart';
import 'package:travelty/recensioni_accessibilita.dart';
import 'package:travelty/recensione.dart';
import 'package:travelty/trasporto.dart';
import 'package:travelty/orario.dart';
import 'package:travelty/utente.dart';

class Luogo {
  int icon;
  double x;
  double y;
  String nome;
  String indirizzo;
  double mediaRecensioni;
  int mediaPericolo;
  List<Recensione> recensioni;
  List<Contatto> contatti;
  List<Orario> orari;
  List<Trasporto> trasporti;
  int mediaAccessibilita;
  List<RecensioneAccessibilita> accessibilita;
  List<Uint8List> images = [];

  Luogo.withImage(
    this.icon,
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
    this.images,
  );

  Luogo(
    this.icon,
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

List<Luogo> luoghi = [
  Luogo(
    0,
    40.77,
    14.79,
    "Università degli studi di Salerno",
    LatLng(40.77, 14.76).toString(),
    4.33,
    1,
    [
      Recensione(
        utenti[1],
        5,
        "Struttura del campus moderna",
        [],
        1,
        5,
      ),
      Recensione(
        utenti[3],
        0,
        "Ampio parcheggio con posti coperti",
        [],
        1,
        5,
      ),
      Recensione(
        utenti[2],
        -5,
        "La gestione della mensa è da migliorare",
        [],
        1,
        3,
      ),
    ],
    [
      Contatto(utenti[1], 4, "lista dei contatti presenti online", [], "sito",
          "https://web.unisa.it/ateneo/contatti"),
    ],
    [
      Orario(
        utenti[2],
        5,
        "orario scolastico",
        [],
        RangeGiornaliero(
          Range("08 : 00", "12 : 00"),
          Range("12 : 00", "19 : 00"),
        ),
        RangeGiornaliero(
          Range("08 : 00", "12 : 00"),
          Range("12 : 00", "19 : 00"),
        ),
        RangeGiornaliero(
          Range("08 : 00", "12 : 00"),
          Range("12 : 00", "19 : 00"),
        ),
        RangeGiornaliero(
          Range("08 : 00", "12 : 00"),
          Range("12 : 00", "19 : 00"),
        ),
        RangeGiornaliero(
          Range("08 : 00", "12 : 00"),
          Range("12 : 00", "19 : 00"),
        ),
        RangeGiornaliero(
          Range("00 : 00", "00 : 00"),
          Range("00 : 00", "00 : 00"),
        ),
        RangeGiornaliero(
          Range("00 : 00", "00 : 00"),
          Range("00 : 00", "00 : 00"),
        ),
      )
    ],
    [
      Trasporto(
          utenti[3],
          4,
          "navetta universitaria gratuita molte volte non passa",
          [],
          [
            Fermata(1, 40.772687, 14.7931639, [
              Range("08 : 28", "08 : 30"),
              Range("09 : 28", "09 : 30"),
            ]),
            Fermata(2, 40.772511, 14.789273, [
              Range("08 : 32", "08 : 33"),
              Range("09 : 32", "09 : 33"),
            ]),
            Fermata(3, 40.767009, 14.792903, [
              Range("08 : 34", "08 : 35"),
              Range("09 : 34", "09 : 35"),
            ]),
            Fermata(4, 40.762099, 14.79366, [
              Range("08 : 38", "08 : 39"),
              Range("09 : 38", "09 : 39"),
            ]),
            Fermata(5, 40.754869, 14.780862, [
              Range("08 : 41", "08 : 42"),
              Range("09 : 41", "09 : 42"),
            ]),
          ],
          "bus",
          "BusItalia",
          "47")
    ],
    0,
    [
      RecensioneAccessibilita(
        utenti[1],
        3,
        "Alcune zone sono difficili da raggiungere con una carrozzina",
        [],
        2,
      ),
    ],
  )
];
