require 'csv'

class Company
  attr_reader :employees

  def initialize
    @employees = []
  end

  def get_employees
    CSV.foreach('employee_list.csv', headers: true) do |row|
      pay_structure = row['pay_structure']
      employee = nil #initializes 'employee' variable below that reps new class Object initialized same was as Employee class objects
      if pay_structure == "commission"
        employee = Commission.new(row)
      elsif pay_structure == "quota"
        employee = Quota.new(row)
      elsif pay_structure == "owner"
        employee = Owner.new(row)
      else
        employee = Employee.new(row)
      end
      @employees << employee
      #the << above allows each employee to be instantiated within
      #the correct salary-type-class and be passed into the
      #@empoyees array (as a collection of various class objects) which
      #allows us to call methods with the
      #same name (display below and for each class) to be called with
      #their respective or inherited version of those methods
    end
  end

  def display
    @employees.each do |employee_type|
      puts employee_type.display  #display method is unique to each different Object's class (commission, quota, etc) but can be called with same name in this scenario
    end
    # print out each of their
  end
end



