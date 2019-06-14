class CreateStars < ActiveRecord::Migration[5.2]
  def self.up
    create_table :stars do |t|
      t.string :number
      t.integer :flag
      t.string :const
      t.integer :lon_d
      t.integer :lon_m
      t.decimal :lon_s, :precision => 4, :scale => 1
      t.string :lat_sign
      t.integer :lat_d
      t.integer :lat_m
      t.integer :lat_s
      t.decimal :mag, :precision => 5, :scale => 2
      t.string :adopted_by

      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
