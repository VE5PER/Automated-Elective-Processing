class Elective{
  String ELECTIVE_ID;
  String ELECTIVE_PDF_LINK;
  String ELECTIVE_NAME;
  Elective(this.ELECTIVE_ID,this.ELECTIVE_NAME,this.ELECTIVE_PDF_LINK);
  Map toJson() => {
    "ELECTIVE_ID":ELECTIVE_ID,
    "ELECTIVE_NAME":ELECTIVE_NAME,
    "ELECTIVE_PDF_LINK":ELECTIVE_PDF_LINK,
  };
}