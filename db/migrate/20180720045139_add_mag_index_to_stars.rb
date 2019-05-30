class AddMagIndexToStars < ActiveRecord::Migration
  def self.up
    add_index :stars, :mag
  end

  def self.down
    remove_index :stars, :mag
  end
end
