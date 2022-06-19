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
}

class RangeGiornaliero {
  Range mattina;
  Range pomeriggio;

  RangeGiornaliero(this.mattina, this.pomeriggio);
}

class Range {
  String inizio;
  String fine;

  Range(
    this.inizio,
    this.fine,
  );
}
