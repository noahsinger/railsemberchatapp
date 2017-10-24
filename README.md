# Rails/Ember Chat App

## Basic chat room application

* This chat application will allow multiple browsers to chat with each other in almost real time.

* A user that signs in to the app is placed in a chat room, where she can talk to everyone already signed in at the time.

* The user can also see the names of the other signed in users.

* The chat room should have responsive design, where messages being sent are on the right and incoming messages are on the left including the user's nickname.

* The UI should look reasonable on a portrait phone, a landscape phone, and a widescreen PC.

* To login to the chat room all you need to input is a nickname.

* A user will only see messages from the time he logged in, the user can't see messages sent in the past before he joined.

* This chat application should be built in Ruby on Rails with the following guidelines:

* Once a user is logged into the chat room the application would work in any of the tabs of that browser without the need to sign in again.
* Client side code of this application should be built in Ember
* Please create a responsive UI for it, use whatever responsive framework you want
* Design the DB just like you would for a production application.
* Don’t forget to write tests (please use Rspec)
* If you are familiar with Coffeescript, please use it.



## ---
# versions
* Ruby version: 2.4.2
* Rails versions: 5.1
* ember_cli: 2.16

# Configuration

## Database creation

* install postgresql
* add postgres user called 'chatappb' or change expected name in config/database.yml
* add password to environment variable called 'chatappB_postgres_password'
* run rails db:setup to create databases
* run rails db:schema:load to create tables

# How to run the test suite

* rspec

# How to run the application

* rails s to start server
* visit http://localhost:3000/

the root route leads to the ember app
