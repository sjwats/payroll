#No comissions list for each employee
#because I would have to re-work a lot of the
#existing app to get it to work.

class SalesController < ApplicationController
  def index
   @sales_results=Sales.read_in_sales#(Rails.root.join('db/Data/sales_data.csv'))
  end
end
