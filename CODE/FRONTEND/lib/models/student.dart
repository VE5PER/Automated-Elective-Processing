class Student{
String S_ID;
String PASSWORD;
String S_NAME;
String YEAR;
String SEMESTER;
String USER_NAME;
String E_MAIL;
Student(this.S_ID,this.PASSWORD,this.S_NAME,this.YEAR,this.SEMESTER,this.USER_NAME,this.E_MAIL );
Map toJson() => {
  "S_ID":S_ID,
  "PASSWORD":PASSWORD,
  "S_NAME":S_NAME,
  "YEAR":YEAR,
  "SEMESTER":SEMESTER,
  "USER_NAME":USER_NAME,
  "E_MAIL":E_MAIL,
};


}

var currentUser;