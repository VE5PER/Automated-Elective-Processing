### Automated Elective processing
<!-- Copy-paste in your Readme.md file -->



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
    <li><a href="#">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributers">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

An application that allocates elective preference of students first come first serve basis automatically. The electives are predefined in the database and the number of electives and the respective credits change dynamically based on the academic year. The main functionality is to allocate electives for students based on their preference. If many students have opted for the same elective, students will be allocated based on the first come first serve basis. The remaining students will be allocated to the elective of their second or next preference based on the availability of seats. If there are over 150% applicants aspiring for the same course, the class would be split into two sections. This allocation will be based on seat availability and faculty availability. 


<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

<a href="https://www.djangoproject.com/">
    <img src="images/django-logo-positive.svg" alt="Logo" width="80" height="80">
  </a>
* [Django](https://www.djangoproject.com/)
* [React.js](https://reactjs.org/)
* [Vue.js](https://vuejs.org/)
* [Angular](https://angular.io/)
* [Docker](https://www.docker.com/)
* [Laravel](https://laravel.com)
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)

<p align="right">(<a href="#top">back to top</a>)</p>

### **GROUP-3** 

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

 

### *About the project*

An application that allocates elective preference of students first come first serve basis automatically. The electives are predefined in the database and the number of electives and the respective credits change dynamically based on the academic year. The main functionality is to allocate electives for students based on their preference. If many students have opted for the same elective, students will be allocated based on the first come first serve basis. The remaining students will be allocated to the elective of their second or next preference based on the availability of seats. If there are over 150% applicants aspiring for the same course, the class would be split into two sections. This allocation will be based on seat availability and faculty availability. 

 

### *Stake holders*

- Students 

- Teachers 

- University Administration 

 

### *Modules* 

- Student Login Module- The student is required to login his/her college credentials to access the elective preference list and view the final elective allocation list 

- Elective Selection module - The student can block/reserve a seat in the favorable elective. 

- Allocation of elective module – Elective is allocated to the requested student if the seats are available else the electives are allocated based on student’s priority preference.   

- Display - The user can request to view the content. 

- Elective Change module- This module is used by the students who are willing to change his/her elective. 

 

### *Table (Master/Transaction)* 

     1. Student List –Master Table 

     - Primary key- Student roll no 

     - Purpose- Elective allocated to the student 

     2. Elective List –Master Table 

     - Primary key- Elective course Id 

     - Purpose- Define the electives offered in a particular academic semester and prerequisites. 

     3. Faculty List –Master Table 

     - Primary key- Faculty roll no 

     - Purpose- Maps the faculty to their respective handling course. 

      4. Preference list 

      - Primary Key – (Student roll no) x (Preference number) 

      - Purpose – To identify and allocate the preferred elective if seats are available. 

 

### *Reports* 

- Elective allocation report: Final students list for every elective. 

- Faculty allocation report: A report on faculties allocated to every elective batch undertaking  

- Elective change report: List the details of students who requested to change electives. 

- Elective Reallocation report: Students who have been re-allocated because of course cancellation/ students' choice 

 

### *Assumptions*

1.There is a pre-defined list of electives which have its own pre-requisites and faculties that are going to handle them. 

2.Web Application (cross platform access) 

3.Elective credit requirements must be met. 

4.Students do not have the access to reorder the elective preference once they have submitted the preference form. 

 

Requirements 

#### *Students:* 

- Uses the student login portal to login and enter the preference page to select the electives for a particular semester. 

- The preferences page displays the available electives with the number of seats remaining and the relevant course information and pre-requisites. 

- Students can make reservations for electives if the present number of seats are full in the same course. 

- Students would be provided with their elective, batch (if any) and their respective batch instructor at the end of the selection phase. 

- Students can request to change their elective at the time given to them and/or finalize their choice. 

 

#### *Faculties/Staffs:*	 

- Login into faculty portal with faculty credentials. 

- The web page consists of the list of electives and the students who have preferred that elective. 

- Faculty can view the finalized list after the end of selection window. 

 

#### *University administration:*

- Offers a predefined set of electives for each semester that may change every academic year. 

- Lay out the prerequisites and eligibility criteria for every elective offered. 

- Allocates faculties to every elective course. 

- Take the decision to remove a particular elective course if there are not enough students to form a separate batch. 

- Take the decision to add an additional batch for the same elective if the reservation of that elective surpasses preset capacity. 

- Handles elective change for students who request to change their elective. 

- Add electives if needed 

- Software requirements: 

- Internet Browser (Google chrome, Safari, Firefox) 

 

#### *Hardware requirements:*

- 4GB RAM 

- Basic Computer setup 

- High speed internet connection 

 







 



 

 

 

 
