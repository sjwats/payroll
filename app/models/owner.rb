
class Owner < Employee
  def gross_pay
    (@base_pay / 12) + commission
  end

  def commission
    commission = Sales.employee_sales
    monthly_sales = commission.values.inject(:+)
    @bonus = monthly_sales > 250000 ? 1000 : 0
    @bonus
  end

  def display
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Commission: #{commission}"
    puts "Net Pay: #{net_pay.round(2)}\n"
  end
end
