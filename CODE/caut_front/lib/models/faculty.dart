class Faculty {
  String FACULTY_ID;
  String PASSWORD;
  String FACULTY_NAME;
  String FACULTY_DOJ;
  String FACULTY_POS;
  String USER_NAME;
  String E_MAIL;
  Faculty(this.FACULTY_ID, this.PASSWORD, this.FACULTY_NAME, this.FACULTY_DOJ,
      this.FACULTY_POS, this.USER_NAME, this.E_MAIL);
  Map toJson() => {
        'FACULTY_ID': FACULTY_ID,
        'PASSWORD': PASSWORD,
        'FACULTY_NAME': FACULTY_NAME,
        'FACULTY_DOJ': FACULTY_DOJ,
        'FACULTY_POS': FACULTY_POS,
        'USER_NAME': USER_NAME,
        'E_MAIL': E_MAIL,
      };
}

var currentUser;
