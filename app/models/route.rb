class Route < ActiveRecord::Base
  self.table_name = "tbl_routes"
  self.primary_keys = :airline, :start, :end,
                      :aircraft, :origin, :destination, :zone
 # belongs_to :mile
  #belongs_to :airline
end
