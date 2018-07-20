class AddAdoptedByAndNumberIndicesToStars < ActiveRecord::Migration
  def self.up
    add_index :stars, :adopted_by
    add_index :stars, :number
  end
  
  def self.down
    remove_index :stars, :adopted_by
    remove_index :stars, :number
  end
end
