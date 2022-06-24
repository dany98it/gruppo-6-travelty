import 'package:flutter/material.dart';
import 'package:travelty/info.dart';

class Orario extends Info {
  RangeGiornaliero lunedi;
  RangeGiornaliero martedi;
  RangeGiornaliero mercoledi;
  RangeGiornaliero giovedi;
  RangeGiornaliero venerdi;
  RangeGiornaliero sabato;
  RangeGiornaliero domenica;

  Orario(
      super.utente,
      super.voto,
      super.informazioni,
      super.votanti,
      this.lunedi,
      this.martedi,
      this.mercoledi,
      this.giovedi,
      this.venerdi,
      this.sabato,
      this.domenica);

  RangeGiornaliero getOrarioOggi() {
    switch (DateTime.now().weekday) {
      case DateTime.monday:
        return lunedi;
      case DateTime.tuesday:
        return martedi;
      case DateTime.wednesday:
        return mercoledi;
      case DateTime.thursday:
        return giovedi;
      case DateTime.friday:
        return venerdi;
      case DateTime.saturday:
        return sabato;
      case DateTime.sunday:
        return domenica;
      default:
        return RangeGiornaliero(Range("", ""), Range("", ""));
    }
  }

  bool isOpen() {
    switch (DateTime.now().weekday) {
      case DateTime.monday:
        return lunedi.isOpen();
      case DateTime.tuesday:
        return martedi.isOpen();
      case DateTime.wednesday:
        return mercoledi.isOpen();
      case DateTime.thursday:
        return giovedi.isOpen();
      case DateTime.friday:
        return venerdi.isOpen();
      case DateTime.saturday:
        return sabato.isOpen();
      case DateTime.sunday:
        return domenica.isOpen();
      default:
        return false;
    }
  }
}

class RangeGiornaliero extends Object {
  Range mattina;
  Range pomeriggio;

  RangeGiornaliero(this.mattina, this.pomeriggio);

  @override
  String toString() {
    return "mattina: $mattina \npomeriggio: $pomeriggio";
  }

  bool isOpen() {
    switch (TimeOfDay.now().period) {
      case DayPeriod.am:
        return mattina.isOpen();
      case DayPeriod.pm:
        return pomeriggio.isOpen();
      default:
        return false;
    }
  }
}

class Range {
  String inizio;
  String fine;

  Range(
    this.inizio,
    this.fine,
  );

  @override
  String toString() {
    return "$inizio - $fine";
  }

  bool isOpen() {
    bool open = false;
    if (TimeOfDay(
              hour: int.parse(inizio.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(inizio.replaceAll(" ", "").split(":")[1]),
            ).hour <
            TimeOfDay.now().hour &&
        TimeOfDay(
              hour: int.parse(fine.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(fine.replaceAll(" ", "").split(":")[1]),
            ).hour >
            TimeOfDay.now().hour) {
      open = true;
    } else if (TimeOfDay(
              hour: int.parse(inizio.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(inizio.replaceAll(" ", "").split(":")[1]),
            ).hour ==
            TimeOfDay.now().hour &&
        TimeOfDay(
              hour: int.parse(inizio.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(inizio.replaceAll(" ", "").split(":")[1]),
            ).minute <
            TimeOfDay.now().minute) {
      open = true;
    } else if (TimeOfDay(
              hour: int.parse(fine.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(fine.replaceAll(" ", "").split(":")[1]),
            ).hour ==
            TimeOfDay.now().hour &&
        TimeOfDay(
              hour: int.parse(fine.replaceAll(" ", "").split(":")[0]),
              minute: int.parse(fine.replaceAll(" ", "").split(":")[1]),
            ).minute >
            TimeOfDay.now().minute) {
      open = true;
    }
    return open;
  }
}

String getDayOfWeek() {
  switch (DateTime.now().weekday) {
    case DateTime.monday:
      return "lunedì";
    case DateTime.tuesday:
      return "martedì";
    case DateTime.wednesday:
      return "mercoledì";
    case DateTime.thursday:
      return "giovedì";
    case DateTime.friday:
      return "venerdì";
    case DateTime.saturday:
      return "sabato";
    case DateTime.sunday:
      return "domenica";
    default:
      return "";
  }
}
