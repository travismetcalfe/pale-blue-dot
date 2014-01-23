class Search < ActiveRecord::BaseWithoutTable
  column :name, :string
  column :number, :string
  column :only_available, :boolean
  column :flag, :boolean
  column :flag_type, :integer
  column :brightness, :boolean
  column :brightness_order, :string

  def after_initialize
    self.flag_type ||= "1"
    self.brightness_order ||= "asc"
  end
end
