require 'csv'
require 'pry'
class Employee
  attr_reader :last_name, :first_name, :base_pay, :tax
  def initialize(attributes)
    @last_name = attributes['last_name']
    @first_name = attributes['first_name']
    @base_pay = attributes['base_pay'].to_i
    @tax = 0.3
  end

  def display
    commission_display
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
    puts "***#{@first_name} #{@last_name}***"
    puts "Gross Salary: #{gross_pay}"
    puts "Net Pay: #{net_pay}\n"
  end
end
