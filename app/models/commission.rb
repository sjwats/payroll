#require_relative 'sales'
class Commission < Employee
  #the initialize method is inherited from Employee which along with attr_reader
  #allows us to instantiate each new Commission employee with the same
  #instance variables used in Employee (@last_name etc) here to call the Commission
  #employees attributes (@last_name,@base_pay, etc)the same way as with Employee.

  #In the company class, everytime a row is passed where the
  #salary structure matches 'commission' the employee is automatically
  #created with a new instance of Commission so the methods below
  #get run once per employee that matches and when we use
  #the instance variables they only correspond to the single employee
  #being instantiated as a new Commission object from the commission class.

  #the other missing methods (net_pay, etc) are also missing because
  #they are being inherited and thus don't have to be repeated here
  def gross_pay
    super + commission
  end

  def commission
    commission = Sales.employee_sales #gives us list of employee sales
    if @last_name == "Lob" #checks to see if the last name of the employee being created/categorized belongs
      commission['Lob'] * 0.005 #if the name belongs, multiplies the employees' sales by their commission percentage
    else
      commission['Bobby'] * 0.015
    end
  end

  def display
    puts "***#{@first_name} #{@last_name}***" #again, as with above can use @first_name etc because we are inheriting the initialize mthod from employees for each class
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n"
  end
end
