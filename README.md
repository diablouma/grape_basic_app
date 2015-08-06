#Grape Basic Project
This project has the basic working structure for a **grape** project connected to MongoDB database.

#Requirements
You need to Install:
  Ruby 2
  MongoDB
  Go inside project folder and run bundle install to download all the dependencies.

#Tests
Tests are built using Rspec

#Running the app:
  Run mongo db:
  `$ mongo`

  Go inside project folder
  `rackup config.ru`

  The application now is running on port 9292, to test it you can go to:
  `http://localhost:9292/api/cars/car`

#Running test:
  Go inside project folder
  `rake test`
