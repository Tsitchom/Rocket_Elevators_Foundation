**Week 14 : DevOps**

Web app : https://raphaelvallee.com

Youtube link : https://www.youtube.com/watch?v=-gPh4fsvoME&feature=youtu.be

Implemented monitoring tools : 
-New Relic
-Google Analytics
-Sumo Logic

All the related information to log into these monitoring dashboards will be located in the privately sent "DevOps Login Raph.txt" file and demonstrated on the Youtube video above.


**Week 10 : TDD**
youtube link : https://www.youtube.com/watch?v=QO5ysEdo8js&feature=youtu.be

**Requirements :** 
Premise : a screen in the Rocket Elevator elevators was added to display interesting HTML content to the users. It can either display weather reports, connect and login to the user's Spotify account to play music or display a funny Chuck Norris quote.

-You will find a content streaming module in the "reusable library" ( /lib section of the app folder called "elevator_media" ). The whole code of the module
is included in the /lib/elevator_media/Streamer.rb file

-The ElevatorMedia module was developped with the Red-Green-Refactoring method. Commentary details all the tests and the methodology
behind them

-The TDD was accomplished with Rspec (http://rspec.info)

-The module and class are respectively the required ElevatorMedia module and Streamer class (/lib/elevator_media/Streamer.rb)

-The Streamer class contains a standard method called "getContent" that returns "interesting" HTML content. The preffered content 
here was Chuck Norris quotes, but "Weather" and "Spotify" content can also be returned. All this content is ONLY available in the getContent method going through a single entry point (the Streamer class as required)

-The methods are 10 lines or shorter

-A lot more tests than the required number were built

-Simplecov was integrated to the TDD to check the app's testing level. It's available in the command line after a text and in a generated file in the /coverage/index.html file

**The files where the TDD was accomplished :** 
--/lib/elevator_media/Streamer.rb 
-- /spec/lib/elevator_media/streamer_spec.rb 
BONUS TESTS:
-- /spec/controllers/pages_spec.rb
-- /spec/controllers/dropbox_spec.rb
-- /spec/controllers/interventions_spec.rb
-- /spec/controllers/stats_spec.rb
-- /spec/controllers/building_details_spec.rb

RED-GREEN-REFACTOR METHOD DESCRIPTION :
All the 24 tests (although some patterns are repetitive) were realized with the Ref-Green-Refactor method. Here are a few examples :

-the "getContent behavior" described first test  was meant to check if getContent returned valid html content. I did not include an html tag in the "include: (like the </div> one) to make the test fail, then added the </div> tag to make sure my content was HTML.

-the 'got spotify login status' test was firstly checking a false authentication, which returned red. I then refactored it to check if the authentication was true, and the test passed. This confirmed the Spotify user was actually logged in. 

-the 'got-open-weather forecast' test expected a specific forecast target first (like "Clouds") but the test failed when the forecast changed. I refactored so every forecast passes (because it now requires a String).


---------------------------------------------------------------------
**CONSOLIDATION : Raphaël Vallée**

Youtube : https://www.youtube.com/watch?v=hLZFcYrgSd8&feature=youtu.be

**RAILS APP**
Log in: remi.gagnon@codeboxx.biz
Pass: 123456
Address : http://raphaelvallee.com/

Week 9 required tasks :
-go to http://raphaelvallee.com/interventions
-fill out the intervention form with your preferred selections. The requirements asked to be able to select an employee or not, a selection of all customers in a dropdown menu, a cascading effect on following dropdowns after the customer selection, the possibility of only selecting one building, column and elevator at a time and the "None" option available on both column, elevator and employee. ALL of those requirements are met in the form.
-a description field is available for the author of the intervention
-a "Submit" button sends the data to the database


===================
**MySQL**
Information about the database : _See privately sent "Consolidation-Raph" document_

Week 9 required tasks : 
-a new table "interventions" has been added to the MySQL raphael_vallee database
-all required columns are present in the required order (author, customer_id, building_id, etc.)
-the battery, column, elevator and employee columns CAN be null 
-the intervention_start and intervention_finish columns ARE null as required
-the intervention_result and intervention_status are respectively "Incomplete" and "Pending" as required

====================

**ZEN DESK**
Team name: Rocket Elevators
Address : rocketelevators93.zendesk.com
Your name: Raphaël Vallée
Email: _See privately sent "Consolidation-Raph" document_
Zendesk password : _See privately sent "Consolidation-Raph" document_
Token : _See privately sent "Consolidation-Raph" document_

Week 9 required tasks :
-when an intervention is sent from the intervention form, a ticket is sent to the Zendesk account and to the raphael.vallee28@gmail.com email account
-the ticket contains the 8 required data from the intervention as well as many more

===================

