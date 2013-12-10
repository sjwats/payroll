require 'csv'
class Employee
  attr_reader :last_name, :first_name, :title, :base_pay, :tax, :pay_structure

  def initialize(attributes)
    @last_name = attributes['last_name']
    @first_name = attributes['first_name']
    @base_pay = attributes['base_pay'].to_i
    @title = attributes['title']
    @pay_structure = attributes['pay_structure']
    @tax = 0.3
  end

  def self.get_employees(csv_file)
    employees = []
    CSV.foreach(csv_file, headers: true) do |row|
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

      employees << employee
      #the << above allows each employee to be instantiated within
      #the correct salary-type-class and be passed into the
      #@empoyees array (as a collection of various class objects) which
      #allows us to call methods with the
      #same name (display below and for each class) to be called with
      #their respective or inherited version of those methods
    end
    employees
  end

  def calculate_tax
    gross_pay * @tax
  end

  def gross_pay
    (@base_pay / 12)
  end

  def net_pay
    gross_pay - calculate_tax
  end

  def display
    "***#{@first_name} #{@last_name}***"
    "Title: #{title}"
    "Gross Salary: #{gross_pay}"
    "Net Pay: #{net_pay.round(2)}\n"
  end
end
