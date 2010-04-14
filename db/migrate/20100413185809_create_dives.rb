class CreateDives < ActiveRecord::Migration
  def self.up
    create_table :dives do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :dives
  end
end
