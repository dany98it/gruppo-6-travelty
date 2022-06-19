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
    "Simone",
    "Spera",
    "28/10/2000",
    "simone.spera.13@gmail.com",
    "Password123.",
    3,
    250,
  ),
];
