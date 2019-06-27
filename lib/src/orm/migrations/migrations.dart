class Migrations {
  static List<String> getMigrations () {
      return [
        "insert into todo(text) values('Clean House')",
        "insert into todo(text) values('Wash Car') ",
        "insert into todo(text) values('Build App')",
        "insert into todo(text) values('Build time machine')",
      ];
  }

}