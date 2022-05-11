class SemElective {
  String YEAR;
  String SEMESTER;
  String NO_OF_ELECTIVES;
  SemElective(this.YEAR, this.SEMESTER, this.NO_OF_ELECTIVES);
  Map toJson() => {
    'YEAR': YEAR,
    'SEMESTER': SEMESTER,
    'NUMBER_OF_BATCHES': NO_OF_ELECTIVES,
  };
}