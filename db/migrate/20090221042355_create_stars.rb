class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.string :number
      t.integer :lon_d
      t.integer :lon_m
      t.decimal :lon_s, :precision => 6, :scale => 2
      t.integer :lat_d
      t.integer :lat_m
      t.decimal :lat_s, :precision => 6, :scale => 2
      t.decimal :mag, :scale => 3, :precision => 10
      t.integer :teff
      t.decimal :logg, :scale => 3, :precision => 10
      t.decimal :mh, :scale => 3, :precision => 10
      t.string :adopted_by

      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
