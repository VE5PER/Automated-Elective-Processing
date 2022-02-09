### Automatic Elective Processing

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

An application that allocates elective preference of students first come first serve basis automatically. The electives are predefined in the database and the number of electives and the respective credits change dynamically based on the academic year. The main functionality is to allocate electives for students based on their preference. If many students have opted for the same elective, students will be allocated based on the first come first serve basis. The remaining students will be allocated to the elective of their second or next preference based on the availability of seats. If there are over 150% applicants aspiring for the same course, the class would be split into two sections. This allocation will be based on seat availability and faculty availability. 

<p align="right">(<a href="#top">back to top</a>)</p>

GROUP-3 

Member Details 

Roll No 

Name 

Role 

 

CB.EN.U4CSE19214 

E Santhosh Bharathi 

Tester, Front End developer  

CB.EN.U4CSE19225 

Maithreyan S 

Backend Developer 

CB.EN.U4CSE19243 

Saurav S 

Backend Developer 

CB.EN.U4CSE19259 

Tejaswi V 

Business Analyst, Front End developer 

CB.EN.U4CSE19263 

Viswabharathi K A 

Project Manager  

 

About the project 

An application that allocates elective preference of students first come first serve basis automatically. The electives are predefined in the database and the number of electives and the respective credits change dynamically based on the academic year. The main functionality is to allocate electives for students based on their preference. If many students have opted for the same elective, students will be allocated based on the first come first serve basis. The remaining students will be allocated to the elective of their second or next preference based on the availability of seats. If there are over 150% applicants aspiring for the same course, the class would be split into two sections. This allocation will be based on seat availability and faculty availability. 

 

Stake holders 

Students 

Teachers 

University Administration 

 

Modules 

Student Login Module- The student is required to login his/her college credentials to access the elective preference list and view the final elective allocation list 

Elective Selection module - The student can block/reserve a seat in the favorable elective. 

Allocation of elective module – Elective is allocated to the requested student if the seats are available else the electives are allocated based on student’s priority preference.   

Display - The user can request to view the content. 

Elective Change module- This module is used by the students who are willing to change his/her elective. 

 

Table (Master/Transaction) 

     1. Student List –Master Table 

Primary key- Student roll no 

Purpose- Elective allocated to the student 

     2. Elective List –Master Table 

Primary key- Elective course Id 

Purpose- Define the electives offered in a particular academic semester and prerequisites. 

     3. Faculty List –Master Table 

Primary key- Faculty roll no 

Purpose- Maps the faculty to their respective handling course. 

      4. Preference list 

Primary Key – (Student roll no) x (Preference number) 

Purpose – To identify and allocate the preferred elective if seats are available. 

 

Reports 

Elective allocation report: Final students list for every elective. 

 Faculty allocation report: A report on faculties allocated to every elective batch undertaking  

Elective change report: List the details of students who requested to change electives. 

Elective Reallocation report: Students who have been re-allocated because of course cancellation/ students' choice 

 

Assumptions 

1.There is a pre-defined list of electives which have its own pre-requisites and faculties that are going to handle them. 

2.Web Application (cross platform access) 

3.Elective credit requirements must be met. 

4.Students do not have the access to reorder the elective preference once they have submitted the preference form. 

 

Requirements 

Students: 

Uses the student login portal to login and enter the preference page to select the electives for a particular semester. 

The preferences page displays the available electives with the number of seats remaining and the relevant course information and pre-requisites. 

Students can make reservations for electives if the present number of seats are full in the same course. 

Students would be provided with their elective, batch (if any) and their respective batch instructor at the end of the selection phase. 

Students can request to change their elective at the time given to them and/or finalize their choice. 

 

Faculties/Staffs:	 

     1. Login into faculty portal with faculty credentials. 

     2. The web page consists of the list of electives and the students who        	have preferred that elective. 

     3. Faculty can view the finalized list after the end of selection window. 

 

University administration: 

Offers a predefined set of electives for each semester that may change every academic year. 

Lay out the prerequisites and eligibility criteria for every elective offered. 

 Allocates faculties to every elective course. 

Take the decision to remove a particular elective course if there are not enough students to form a separate batch. 

Take the decision to add an additional batch for the same elective if the reservation of that elective surpasses preset capacity. 

Handles elective change for students who request to change their elective. 

Add electives if needed 

Software requirements: 

Internet Browser (Google chrome, Safari, Firefox) 

 

Hardware requirements: 

4GB RAM 

Basic Computer setup 

High speed internet connection 

 

Epics- 

Invision link 

 

Epic: User Authentication and Validation 

User Registration – As a user, I would like to register myself easily 

Design Registration page  

Implement the registration page with relevant UI, icons and images  

Implement registration form validation  

Create SQL scripts to create tables 

Create triggers on user registration 

Store registered user credentials in the database 

Report of students who have registered successfully on the platform, year, and department wise 

User login- As a user, I would like to login effortlessly 

Design login page for teachers 

Design login page for students 

Design login page for admin 

User mapping/ authentication (credentials verification) 

Remember credentials module	 

Keep me signed in module 

Clear credentials functionality	 

Forget password workflow- As a user, I would like to reset my password if I forget it 

Button to reset password 

Create password reset link 

Send password reset link on the registered email id 

Validating the new password strength 

Update password in database 

Implement triggers on password updates 

Redirect the user to login page 

Microsoft login support - As a user, I would like to be able to login effortlessly with my Microsoft Account 

Button for Microsoft login 

Microsoft login screen 

Fetch organisational mail, password 

Store secure cookies 

Redirect to dashboard upon success 

User Logout- As a user, I would like to logout effortlessly 

Button to logout 

Confirm mail id for receiving mails about updates – alert  

Confirm before logout 

Redirect the user to the logout screen 

Button lo login from logout screen 

Redirect to the login screen if button clicked 

Prioritising User stories- 

Designing and implementing user registration form –MUST HAVE 

Designing and implementing user login form- MUST HAVE 

Validating the fields in the form - SHOULD HAVE 

Adding a Microsoft login support – COULD HAVE 

Adding user logout module- MUST HAVE 

 

Epic: Dashboard 

Manage login 

Sync account with MS 

Manage passwords: As a user, I want to be able to change/improve my auth services 

Create a change password option. 

Create a verification dialogue box before changing the password 

Design a Change Password page 

Add a button Change password that is connected to Database 

Design an algorithm to logout and redirect to login page 

Add an alert dialogue box if there was an error in changing password 

Implement change password workflow in DB: As a student, I want to be able to change my password preference. 

Validate password 

Restrict frequent password changes 

Setup 2FA and/or OTP 

Trigger mail to Student if password changed 

Block password reuse. 

Elective preferences 

Student login, display electives available 

Display the elective preferences if form already filled 

If teacher, display students who enrolled in an elective 

Count of seats left for different electives 

Notification 

Notify update from the teacher 

Notify updates about final elective list  

Notify updates about elective cancellation  

Notify updates about elective reallocation 

Logout 

Confirm mail id for receiving mails about updates -alert 

Confirm before logout - alert 

Redirect the user to the logout screen 

Button to redirect to login screen 

Redirect to the login screen if button clicked			 

 

 

Epic: Elective Selection 

As a student, I need to choose my elective preferences. 

Design an elective selection webpage. 

Lists every elective on the webpage that are offered by 	accessing the course database. 

Add a number field alongside the elective name, for ordering the preference. 

Create a popup window that asks for confirmation, gets 	invoked if the save button is clicked. 

Add a query to display an error message if the preference is not properly selected.   

As a student, I want to see the course details along with its prerequisites. 

Create a hyperlink for every listed elective on the selection webpage and link it to the course details webpage. 

Design a separate webpage that shows course details 

Create a container that shows the L-T-P plan, CO, PO and the total number of credits in the course details webpage. 

List the prerequisites in the course details webpage. 

Create a button and link it to details of the next elective. 

Create a Back button, that directs the user to the elective selection webpage. 

As a student, I want an elective allocation agreement policy page. 

Create a button on the elective selection webpage and link it to the policy webpage. 

Design an agreement policy webpage that states the agreement policy. 

List out all the policies and terms for choosing elective preference in the policy webpage. 

Create a checkbox and a text alongside stating “I have read the terms and ready to proceed further”. 

Create a Back button, that directs the user to the elective selection webpage. 

As a student, I want to save the preference that I have opted for future reference 

Create a Save button on the elective section webpage. 

Add appropriate tags and icons near the button. 

Write queries to update the database with the chosen preferences once the save button is clicked. 

Create a track details button on the elective selection webpage and write appropriate API calls for redirecting. 

Create a UI to show the selected elective preference if the track details button is clicked. 

As a student, I want to know the total availability of seats, how many seats are filled and how many seats are left in each elective in real time. 

Create a widget that displays the total availability of seats. 

Write queries to access the database for getting the remaining available seats and display the seats left in the elective selection webpage. 

Write appropriate API calls for auto updating the seats left on the elective selection webpage. 

Highlight the seats left field using bold fonts and dark font colour.  

As a student, I want a timer that shows the remaining time left for choosing the elective. 

Display the remaining time on the elective selection webpage. 

Write queries and import appropriate functions to display a countdown timer that operates in real time. 

Sync the timer with NIST. 

Write the required API calls for updating the remaining time. 

 

 

Epic: Elective Allocation  

As an admin, I want to store and access the data. 

Analyse the requirements of the user. 

Design a master table for the system. 

Normalize the tables. 

Create a Database and add the tables 

Connect the Database with the application 

Design a Page with access to Database for the admin 

As an admin, I want to be able to set the vacancies for a course. 

Design a page to add courses and max possible number of batches. 

Add a batch size element for elective. 

Connect the Faculty Table from DB to allot faculties to the electives. 

Connect the Database with this page. 

Create a button in Admin dashboard and link this page. 

Connect the elements of this page to students’ elective list page.  

As an admin, I want to allocate seats automatically according to students’ preferences. 

Requirement analysis for the task. 

Build a flowchart and create a flow of the algorithm. 

Coding Phase – Code the algorithm 

Connect the Code with the database. 

Retrieve the elements from DB and add them as an object to the code. 

Link the output to the ‘final list of students’ page. 

As an admin, I want to allocate batches for each elective. 

Design a page that shows every elective and count of each preference. 

Frame the conditions for the batch allocation. 

Build a pseudocode for the algorithm. 

Develop relevant algorithm 

Add the batch allocation module to the backend. 

Sync with User Interface 

As an admin, I want a list of student allocation generated at the end of registration phase. 

Design the elements of this page. 

Retrieve the final list from the students’ allocation algorithm. 

Create a list with all the required details that is to be shown on the page. (Student’s name, Student’s ID, Elective, Batch etc.) 

Connect to Database and auto update the values. 

Create a button to publish the elective of students. 

Connect the functionality of this button to students’ course page where they can see their allocated elective. 

  

Epic: Change of Elective  

User Stories: 

Elective change request page: As a student, I want to have an option to change the elective. 

Check seat availability from Database 

Request Migration workflow (Enquire concerning tables). 

Block transfer possibility if seats unavailable 

Transfer student from course if applicable in records. 

Write Queries to shift slot in db. 

Sync UI to update data. 

Open and closed electives: As a student, I would like to view the current availability of each elective. 

Check seats availability in the DB 

Ensure faculty availability from the DB 

Implement API calls to check academic criteria of electives. 

Dynamic UI to signify elective status (open/closed) 

Live UI showing activity of registration. 

Implement student transfer workflow. 

Reservation and Acceptance percentage: As a student I need to know how many seats will be accepted upon reservation 

Read reservation limit from DB. 

Ensure faculty availability 

Ensure enough candidates reserving an elective 

Create reservation workflow 

Support workflow based on allocation algorithm. 

Sync UI to reflect batches. 

Time left: As a student, I want a timer that shows the remaining time left for changing the elective. 

Live time left calculation. 

Persistent connection from backend 

Sync backend clock with NIST. 

Update DD:HH:MM:SS UI every second. 

Change colour of UI element according to time left. 

Block actions if time over. 

Elective details with staff Page details: As a student, I want to know the staff responsible for all the electives. 

Query details about faculties qualified. 

Display faculty name against every elective. 

List faculty details in an expandable widget. 

Link hyperlink to faculty page 

Facilitate multiple faculty display if applicable. 

  

Epic: Teacher's Access over the portal 

User Stories: 

 Teacher's homepage 

Design a page with profile 

Design a notification tab 

Embedded button to edit password 

teacher's Schedule Page 

Drop down menu   

Retrieve info on day and time for the course 

Display the info in a table 

Buttons to download and share the displayed info 

Student's list 

Input fields for course details 

Submit button to accept details from input fields 

Retrieve names of students enrolled for course from database 

Retrieve names of students requested for elective change from database 

Display the retrieved names in a table under 2 separate categories 

Allocation of classes to each topic 

Input fields for course details 

Submit button to accept details from input details 

Input fields for topic/day/time/classes 

Allocate the classes if available from the database 

Send notification to student dashboard 

Update workflow 

Input fields for course details 

Input fields update by the teacher 

Update the database with the changes made 

Notify the update to student dashboard 

 

 

 

 
