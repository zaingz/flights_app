class Airline < ActiveRecord::Base
  self.table_name = "tbl_airlines"
  self.primary_key = :airline

  attr_accessor :picture
end
