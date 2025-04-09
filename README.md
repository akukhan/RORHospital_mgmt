# Rails app with Receptionist & Doctor Portals

### This is a Rails application that proivdes separate portals for recptions, doctors, and patients in a medical setting. The application allows receptionists to register and manage patients, while doctors can views patient information and visialize patient registration statistics , and patients can manage their appointments.

### Desktop View
![Desktop Screenshot](screenshots/desktop.png)

### Mobile View
![Mobile Screenshot](screenshots/mobilerecptionist.png)

## Features

### Authentication
 - Single login page for both receptionist and doctor portals
 - Role base access control(receptionist, doctor or patient)
 - Patient user can create their new account and login.
 - Patient user can create an appointment.
 - Secure authenciation using Devise.
 - Password reset using registered email.

###🧾  Receptionist Portal
  - Register new patients.
  - View list of all patients.
  - Views details patients information.
  - Update or delete patients details.

### 🩺 Doctor Portal
  - View list of all registred patients.
  - Search patient using name and email.
  - View details patient information.
  - Dashboard with patient registration statistics.
    - Total patients.
    - New patients this week.
    - Today's appointments.
  - Graph showing patient registration over time.    
  - View Upcoming appointments.
  - View the status of the appointment.
  - Update patients details too if necessary.
 

### Patient User Portal.
  - Patient User can register providing the details.
  - Create an appointment.
  - Patient user have it own dashboard, my appointment tab.
  - View the status of the appointment.

### Technical details
  - Database
    - PostgreSQL
    - Configure config/database.yml:
    ```
    username: yourPostgreSQLusername
    password: yourdbpassword
    ```
    - start your PostgreSQL if not default running
  - Model
    - User(role base authentication)
    - Patient( with necessary patient information)
    - Patient User( new patient registration by patient itslef and taking appointment)

### Frontend
 - Responsive design using bootstrap that works on both desktop and mobile devices.
 - Chart using Chartkick and Chart.js.
 - Simple and clean user inerface.

 ### Setup instructions.

 1. clone the repository.
 2. Install dependencies
    ```
    bundle install
    ```
 3. Set up the database:
    ```
    rails db:create
    rails db:migrate
    ```
 4. Check the db:seed
    ```
     rails db:seed
    ```
 5. Start the Rails server
    ```
    rails s
    or
    rails server
    ```
6. Access the application at http://localhost:3000

### Additional info ✉️ Email SMTP Setup
    Setup email sending by configuring your credentials in Gmail or another SMTP provider.
    See instructions in the Google Developer Console.

## Author

**Aku**

- Github: [@akukhan](https://github.com/akukhan)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments




## 📝 License

This project is [MIT](./MIT.md) licensed.