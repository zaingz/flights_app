class Alliance < ActiveRecord::Base
  self.table_name = "tbl_alliances"
  self.primary_keys = :alliance, :airline

  attr_accessor :picture
end
