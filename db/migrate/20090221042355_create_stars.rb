class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.string :number
      t.string :coordinate
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
