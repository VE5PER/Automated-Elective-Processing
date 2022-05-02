class Elective {
  String ELECTIVE_ID;
  String ELECTIVE_PDF_LINK;
  String ELECTIVE_NAME;
  String SEATS;
  Elective(
      this.ELECTIVE_ID, this.ELECTIVE_NAME, this.ELECTIVE_PDF_LINK, this.SEATS);
  Map toJson() => {
        "ELECTIVE_ID": ELECTIVE_ID,
        "ELECTIVE_NAME": ELECTIVE_NAME,
        "ELECTIVE_PDF_LINK": ELECTIVE_PDF_LINK,
        "SEATS": SEATS,
      };
}
