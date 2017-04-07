# Building Violations App

Rails app that imports a CSV file into a postgres db and calculates the number of violations in each category, and the earliest and latest violation date for each category.

Steps to run:

1. Download and unzip folder into your home directory

2. cd into 'building-violations-app-master'

3. Run ` rails db:create `, `rails db:seed`, `rails db:migrate` followed by ` rails s ` to start up the application.
