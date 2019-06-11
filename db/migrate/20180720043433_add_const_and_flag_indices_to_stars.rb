class AddConstAndFlagIndicesToStars < ActiveRecord::Migration[5.2]
  def self.up
    add_index :stars, :const
    add_index :stars, :flag
  end

  def self.down
    remove_index :stars, :const
    remove_index :stars, :flag
  end
end
