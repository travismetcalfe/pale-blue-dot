class Search < ActiveRecord::BaseWithoutTable
  column :name, :string
  column :number, :string
  column :only_available, :boolean
  column :brightness, :boolean
  column :brightness_order, :string

  def after_initialize
    self.brightness_order ||= "asc"
  end
end
