#Grape Basic Project
This project has the basic working structure for a **grape** application that connects to a MongoDB database.

##Setting up dev environment

Run `$ vagrant up` to create the vm.

After the machine is created, run `$ vagrant provision`. This will install the necessary software to get you up and running.

We are using SaltStack as the provisioning tool. If you need to add new software to the app, you will have to add a Salt State file under `salt/roots/` folder.

If you are not using Vagrant (but I recomend using it), you will need to install the following software in your machine:
  - Ruby 2
  - MongoDB
  - Manually run `$ bundle install` to download all the dependencies.

##Running the app:
  MongoDB should already be running, but if not run `$ mongod`

  To run the server do `rake app`

  The application will run on port 9292. To test if it's working, try visiting this address in your browser:

  `http://localhost:9292/api/comments`

  Run `rake app_stop` to stop the app

##Tests

Tests are built using Rspec

##Running tests:
  While in the root of the project run `$ rake test`. This will run every test in the project.

  You can run different kinds of tests by doing:

  `$ rake test_unit` for unit tests

  `$ rake test_integration` for integration tests

  `$ rake test_functional` for functional tests
