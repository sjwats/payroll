require'csv'
require 'pry'
class Sales
  attr_reader :monthly_sales  #allows monthly sales to be available to Owner class

  def initialize
    @monthly_sales = []
  end

  def self.monthly_sales
    @monthly_sales = []
  end

  def self.read_in_sales

    CSV.foreach('sales_data.csv', headers: true) do |row|

      @monthly_sales << row.to_hash
    end
    @monthly_sales
  end

  def self.employee_sales
     monthly_sales  #unsummed array of hashes with employee sales subtotals
     read_in_sales

    @bobby = 0
    @wiggum = 0
    @groundskeeper = 0
    @lob = 0
    sales_total = {} #initializes empty hash so we can add key-value pairs and sum the sales for each appropriate employee
    @monthly_sales.each do |hash|
      @bobby += hash["gross_sale_value"].to_i if hash["last_name"] == "Bobby"
      @wiggum += hash["gross_sale_value"].to_i if hash["last_name"] == "Wiggum"
      @groundskeeper += hash["gross_sale_value"].to_i if hash["last_name"] == "Groundskeeper"
      @lob += hash["gross_sale_value"].to_i if hash["last_name"] == "Lob"
    end
    sales_total['Bobby'] = @bobby
    sales_total['Lob'] = @lob
    sales_total['Wiggum'] = @wiggum
    sales_total['Groundskeeper'] = @groundskeeper
    sales_total #last value is returned when we call the employee_sales method on the new instance of Sales in commission/quota etc so we can access the total sales for each employee
  end
end
