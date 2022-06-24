class Utente {
  String nome;
  String cognome;
  String dataNascita;
  String email;
  String password;
  int rank;
  int esperienza;

  Utente(
    this.nome,
    this.cognome,
    this.dataNascita,
    this.email,
    this.password,
    this.rank,
    this.esperienza,
  );
}

var utenti = [
  Utente(
    "Utente",
    "Test",
    "01/01/2000",
    "utente.test@dany98.it",
    "Password123.",
    3,
    250,
  ),
  Utente(
    "Simone",
    "Spera",
    "28/10/2000",
    "simone.spera.13@gmail.com",
    "Password123.",
    3,
    250,
  ),
  Utente(
    "Daniele",
    "De Marco",
    "14/10/1998",
    "demarcodaniele98@gmail.com",
    "Password123.",
    2,
    150,
  ),
  Utente(
    "Angelo",
    "Coralluzzo",
    "28/10/2000",
    "angelo.coralluzzo@gmail.com",
    "Password123.",
    1,
    50,
  ),
];

var utenteLoggato = utenti[0];
