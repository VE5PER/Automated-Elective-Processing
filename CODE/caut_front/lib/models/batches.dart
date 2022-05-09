class Batches {
  String YEAR;
  String SEMESTER;
  String ELECTIVE_ID;
  String BATCH_SIZE;
  String NUMBER_OF_BATCHES;
  Batches (
      this.YEAR, this.SEMESTER, this.ELECTIVE_ID, this.BATCH_SIZE,this.NUMBER_OF_BATCHES);
  Map toJson() => {
    'YEAR': YEAR,
    'SEMESTER':SEMESTER,
    'ELECTIVE_ID': ELECTIVE_ID,
    'BATCH_SIZE': BATCH_SIZE,
    'NUMBER_OF_BATCHES': NUMBER_OF_BATCHES,
  };
}