class EmployeesController < ApplicationController
  def index
    @employees=Employee.get_employees(Rails.root.join('db/Data/employee_list.csv'))
  end
end


##put csv files under config folder in db within
#the apps folder


##the models (our classes) allow you to use
# the methods defined there

##circular dependency - calling someting that's
#calling something that's calling something etc..

#only need to be concerned with models, views, controllers
#for this challenge
