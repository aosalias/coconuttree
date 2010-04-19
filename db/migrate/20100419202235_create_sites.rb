class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.string :min_depth
      t.string :max_depth
      t.string :avg_depth
      t.string :nitrox_mix
      t.string :difficulty
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sites
  end
end
