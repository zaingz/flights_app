class Aircraft < ActiveRecord::Base
  self.table_name = "tbl_aircrafts"
  self.primary_keys = :airline, :aircraft, :seat
  attr_accessor :picture
  #belongs_to :airline
end
