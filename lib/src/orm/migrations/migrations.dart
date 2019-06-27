class Migrator {
  static Map<String, String> getMigrations() {
    return {
      "1-add mock data": "insert into todo(text) values('Clean House')",
      "2-add mock data": "insert into todo(text) values('Wash Car')",
      "3-add mock data": "insert into todo(text) values('Build App')",
      "4-add mock data": "insert into todo(text) values('Build time machine')"
    };
  }
}
