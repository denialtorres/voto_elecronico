# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* System dependencies

run `bundle install`

* Database creation

run `rake db:nuke`

* Initialize development

`vagrant up && vagrant ssh`

Once inside vagrant run `cd /vagrant` and run `puma`.

Then you can go to [localhost:3000](http://localhost:3000)

* How to run the test suite

run `rspec spec`

* Deployment instructions

run `mina deploy`


Testing -

Unit Test
  - models, views, routes etc
  - each individual component is tested one item at time
  - typically results in very good coverage

Functional Test (Its part of integration test)
  - controllers
  - testing multiple components and how they collaborate with each other
  - multiple models in process

Integration Test
  - Integration test is when a business process is followed to 
  completion to meet a business objetive
  - Typically Involves emulating a user, for example loggin in
  and clicking on a purchase button or links etc