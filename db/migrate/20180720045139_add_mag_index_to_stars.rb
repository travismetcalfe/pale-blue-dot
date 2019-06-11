class AddMagIndexToStars < ActiveRecord::Migration[5.2]
  def self.up
    add_index :stars, :mag
  end

  def self.down
    remove_index :stars, :mag
  end
end
