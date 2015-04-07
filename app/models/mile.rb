class Mile < ActiveRecord::Base
  self.table_name = "tbl_miles"
  self.primary_keys = :alliance, :zone, :miles
end
