class Search < ActiveRecord::Base
  has_no_table
  column :name, :string
  column :number, :string
  column :flag_type, :integer
  column :const_type, :string
  column :brightness_order, :string
  column :only_available, :boolean

  after_initialize :set_defaults
  def set_defaults
    self.flag_type = self.flag_type.to_i
    self.const_type ||= "ALL"
    self.brightness_order ||= "num"
    self.only_available = self.only_available.to_s == "true"
  end
end
