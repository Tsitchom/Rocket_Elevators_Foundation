**WEEK 7 : APIs ---- http://raphaelvallee.com ** Youtube link : https://www.youtube.com/watch?v=-kiiY7i1NOU

1) Google Maps API :
The Google Maps API can be accessed through the "GEOLOCATIONS" menu on the top of raphaelvallee.com. Although the Codeboxx file mentionned to put it in the admin panel, we were told from Philippe it was also okay to put it on the main page, which we did. The user has to be authenticated first. You can use the user email "philippe.bouillon@codeboxx.biz" with the following password : "123456". Then, you will be able to access the Google Maps API with all the markers on the map on which you can click to see the Info Window that tells the following info: localization of the building (its address), number of floors, the customer's name, the number of batteries, columns and elevators and the full name of the tech contact. 
**WARNING** : we exceeded our geocoding quota for the March 29th 2019 day so if you run the GEOLOCATION portion of our website, you may not get all the 200 markers (see the following response by the server and the youtube video)  -----> "You have exceeded your daily request quota for this API. If you did not set a custom daily request quota, verify your project has an active billing account: http://g.co/dev/maps-no-account"

2) Twilio :
Twilio sends a notification to a customer's cellphone when an elevator's status is changed to ''intervention''. For our use case, the Coach correcting the work will have to change one of the phone numbers in the database for his own phone number through the dashboard in Buildings->edit on in the "phone number tech person" field, NOT the "phone number admin person". The user will then receive the following message on his phone : "Status of elevator number {elevator id} of column number #{column number} of battery number #{battery number} of building at #{address} in {city} passed to 'intervention' ". To trigger it, the user can log into the 'EMPLOYEE' section, use  the user email "philippe.bouillon@codeboxx.biz" with the following password : "123456", go in the 'Elevators' section of the dashboard and change an elevator status to 'intervention' to receive a text message. 

3) Slack :
Slack works kind of in the same way as Twilio in the sense that it sends a Slack message to the Rocket Elevators Slack workspace in the #elevator_operations to notify the user that an elevator has changed status. To trigger it, the user can log into the 'EMPLOYEE' section, use  the user email "philippe.bouillon@codeboxx.biz" with the following password : "123456", go in the 'Elevators' section of the dashboard and change an elevator status to whatever the status is to receive a Slack message. 

4) Dropbox :
To see how Dropbox works, the user can create a lead in the 'Contact' form on the main page of raphaelvallee.com . To see how Dropbox works though, the created lead has to be an existing customer. We suggest populating the following fields with the associated content :
Full name : Elyse Preist , Email : sdunnaway4@fastcompany.com , Company Name : Buzzdog , (the other fields can be filled with whatever yuou want). Then, select a file to upload in the attachment field. Then you can login to the Dropbox account with the email and password transmitted to Philippe privately in Slack by Raphaël Vallée. You will then be able to see the new file registered in Elyse Preist's account section in our Dropbox.

5) Sendgrid : 
The Sendgrid API is triggered when the Contact form is filled and sent by the user. The user has to enter a VALID email for the Sendgrid API to work. Once the user presses the ''Send Message'' button, an email is sent to the user's email address. **WARNING** : the email will first go in the SPAM category **and the Rocket Elevators logo will NOT be viewable**. The user will have to accept the spam for the email to go in the usual reception box and the logo will appear.

6) IBM Watson :
This API is pretty simple. The user has to go in the ''EMPLOYEE'' section of the website (it can be accessed through the main page). You can login with the user email "philippe.bouillon@codeboxx.biz" with the following password : "123456". The IBM Watson API can be accessed through the dashboard's main page. Because IBM Watson is pretty restricted and sensitive in terms of quotas, the user has to press the PLAY button in the menu under the 'Your Vocal Assistant' portion of the dashboard. The required message will then be played.

7) Zendesk :
The user first has to login to the Zendesk account with the credentials given to Philippe privately in the Codeboxx Slack Workspace. Then, he can either fill a contact form in the main page or a quote in the /gform section of the website (this is ususally done by a customer, but for the purpose of this simulation the user will have to do it). The Rocket Elevator employee will then receive a ticket in his Zendesk API related to the demand made by the customer. The employee will then be able to answer the ticket generated from the user's demand in the Zenbdesk API to follow-up.

****************END OF WEEK 7 READMe ***********************************************************************




WEEK 5 : MYSQL & POSTGRESQL DATABASES

1) We added all the new tables in MYSQL with all the required rows and columns in regards to the mandate we had this week. In all, 8 new tables were created in MYSQL. You can see them in our Rails_Admin dashboard by logging in with an email (for example philippe.bouillon@codeboxx.biz) and a password (123456). You can also see them in MYSQL Workbench. The tables that needed it were assigned primary keys and foreign keys.

2) Multiples sections in the Rails_Admin dashboard were created in relation to the tables that were asked. You can also edit, delete and see the content of the tables in these menus. The relationships between the objects are all visible in the dashboard tables. New data can be entered/created through the dashboard, as well as the website itself.

3) Data was created from scratch with the help of the Mockaroo app. We used this data to populate the tables you see in MySQL and those you will see in Postgresql. The data is in concordance with what was asked in the "Codeboxx : week 5" file.

4) A data warehouse was created on Postgresql and was also linked to our Rails app to stock the data harvested through MySQL from the website or the dashboard. The data was placed in the 4 tables that were asked in the "Codeboxx week 5" file. With the help of the Whenever and PG gems, the content of these tables is updated in Postgresql every 2 minutes. The changes from the MySQL DB are refreshed in real time in the 4 Postgresql tables.

5) The data present in the table is then used with two dimensions (time & customers) to be analyzed and returned with the help of the three queries asked in the "Codeboxx week 5" file. The three queries will returned the answer to the three questions asked in the file.

6) Finally, the three queries will be represented in the "STATS" section of the Website to be analyzed in the form of graphical interfaces.

Have a great time correcting our project ! 
--------------------------------------------
# README
PASSWORDS: The passwords of the users are ALL "123456" by default. Every new user created in the DB has this password. 
Nadya : 123456
Felix-Antoine : 123456
Philippe: 123456
Serge: 123456
Mathieu H.: 123456
Mathieu L.: 123456
Remi: 123456
-------------------------------------------

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
