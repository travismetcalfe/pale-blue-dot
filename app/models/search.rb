class Search < ActiveRecord::BaseWithoutTable
  column :name, :string
  column :number, :string
  column :flag_type, :integer
  column :const_type, :string
  column :brightness_order, :string
  column :only_available, :boolean

  def after_initialize
    self.flag_type ||= 0
    self.const_type ||= "ALL"
    self.brightness_order ||= "num"
    self.only_available ||= false
  end
end
